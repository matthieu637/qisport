#!/bin/csh

#VARIABLES A MODIFIER
#chemin vers les dossiers java
set workspacePATH = "~/workspace" 
#chemin où le site sera installé
set qisportPATH = "~/public_html/cv/projet/qisport"
#chemin où le serveur peut trouver les sessions du site
set sessionPATH = "~/public_html/cv/projet/qisport/sessions"



#CONSTANTES
#port d'écoute du serveur ( peut provoquer des conflits avec https si 443 )
set port = '443'
set gitPATH = 'git://github.com/matthieu637/qisport'

###
set usage_message = 'ERREUR : usage : $0 <net/off> <rm/nrm> <all/site> \
		     net/off : mise à jour ou simple build \
		     rm/nrm : suppression total des jar ou non \
		     all/site : sauvegarde du site non '
################################# VERIFICATION DES ARGUMENTS

if( $#argv != 3 ) then
	echo 'ERREUR : nombre d argument incorrect'
	echo $usage_message
	exit(1)
endif

if( ( $1 != 'net' && $1 != 'off' ) || ( $2 != 'rm' && $2 != 'nrm' ) || ( $3 != 'all' && $3 != 'site' ) ) then
	echo 'ERREUR : argument incorrect'
	echo $usage_message
	exit(2)
endif


################################# UPDATE WORKSPACE

#Suppression de l'ancienne configuration
if( ($2 == 'rm') && (-e $workspacePATH/trunk/) ) then
	rm -rf $workspacePATH/trunk/
endif

cd $workspacePATH

if( $1 == 'net' ) then
	if( $2 == 'rm' ) then
	 	git clone $gitPATH . 
	else
		git pull .
	endif
endif

################################# EXPORT QI_SPORT PHP

#Suppression de l'ancienne configuration
if( -e $qisportPATH ) then
	
	if( $3 == 'site' ) then
		set applet_save = `mktemp`
		mv $qisportPATH/applet.jar $applet_save
	endif

	rm -rf $qisportPATH
endif

#export dossier
cp -r $workspacePATH/QI_Sport/ $qisportPATH

#droit sur dossier
chmod -R g+rx $qisportPATH
chmod -R o-rwx $qisportPATH
chmod -R g+w $qisportPATH/cache
chmod -R g+w $qisportPATH/templates_c

#suppresion des fichiers inutiles
rm -rf $qisportPATH/install
rm -rf $qisportPATH/.project
rm -rf $qisportPATH/.buildpath


################################# CONFIGURATION Variables.php

set tmp1 = `mktemp`
set tmp2 = `mktemp`

sed 's/define("DEBUG",.*/define("DEBUG","FALSE");/' $workspacePATH/QI_Sport/variables.php > $tmp1
sed 's/define("HOST_APPLET",.*/define("HOST_APPLET","82.232.147.48");/' $tmp1 > $tmp2
sed 's/define("APPLET_PATH",.*/define("APPLET_PATH","applet.jar");/' $tmp2 > $tmp1 

sed 's/define("PORT_APPLET".*/define("PORT_APPLET","'"$port"'");/' $tmp1 > $tmp2
sed 's/define("MAIN_PATH".*/define("MAIN_PATH",".\/");/' $tmp2 > $tmp1

mv $tmp1 $qisportPATH/variables.php
rm $tmp2

chmod g+rx $qisportPATH/variables.php
chgrp http $qisportPATH/variables.php

if( $3 == 'site' ) then

	mv $applet_save $qisportPATH/applet.jar
	chgrp http $qisportPATH/applet.jar

	echo "Site updated"
	exit(0)
endif

################################# BUILD APPLET

cd $workspacePATH/QiS-GameApplet/
ant -buildfile build.xml

chmod g+rx applet.jar
chmod o-rwx applet.jar

mv applet.jar $qisportPATH/

################################# BUILD SERVER


cd $workspacePATH/QiS-GameServer

if ( -e build ) then
	rm -rf build
endif

ant -buildfile build.xml >& /dev/null

cd build

chmod u+x startQiS.sh
chmod u+x QiS-GameServer.jar

set tmp1 = `mktemp`
set tmp2 = `mktemp`

sed 's/^QiS.session.path=.*/QiS.session.path=\/home\/matthieu\/sessions\//' config/config.properties > $tmp1
sed 's/QiS.main.port.*/QiS.main.port='"$port"'/' $tmp1 > $tmp2

mv $tmp2 config/config.properties
rm $tmp1



/*
Copyright (c) 2011  <Matthieu Zimmer>

Permission is hereby granted, free of charge, to any person obtaining a copy of 
this software and associated documentation files (the "Software"), to deal in 
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
SOFTWARE.
*/

package com.qis.gameserver;

import java.io.File;

import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;

import com.peanuts.commands.Command;
import com.peanuts.commands.CommandManager;
import com.peanuts.commands.ForceShutdownCommand;
import com.peanuts.commands.HelpCommand;
import com.peanuts.commands.PerformanceCommand;
import com.peanuts.database.DatabaseFactory;
import com.peanuts.database.DatabaseMemoryManager;
import com.peanuts.utils.Performance;
import com.peanuts.utils.UniqueProcess;
import com.qis.commons.Sport;
import com.qis.gameserver.dao.AbstractDAOFactory;
import com.qis.gameserver.dao.object.Questionnaire;

/**
 * @author Matthieu637
 * 
 */

public final class QiSGameServer {
	public static AbstractDAOFactory					dao;
	public static DatabaseMemoryManager<Questionnaire>	questionnaireMemory;

	public static CustomAnswerTable						customAnswerMemory;
	private static final Logger							log	= Logger.getLogger(QiSGameServer.class);

	public static void main(String[] args) {

		long start = System.currentTimeMillis();

		initConfigServices();
		initMemory();

		new QiSIOServer(QiSConfig.MAIN_PORT, false);

		Performance.printMemoryUsage(Performance.PERFORMANCE_KB);

		log.info("###########################################################################");
		log.info("QI Sport Server launch in " + (System.currentTimeMillis() - start) / 1000 + " secondes.");
		log.info("###########################################################################");
	}

	/**
	 * 
	 */

	private static void initConfigServices() {

		// init LoggingService
		DOMConfigurator.configure("config" + File.separator + "log4j.xml");

		QiSConfig.load();

		Sessions.checkSessionPath();

		UniqueProcess.launch(QiSConfig.MAIN_PORT, true);

		DatabaseFactory.init();

		dao = AbstractDAOFactory.getFactory(AbstractDAOFactory.PSQL_DAO_FACTORY);

		CommandManager.listen(new Command[] { new HelpCommand(), new ForceShutdownCommand(), new PerformanceCommand() });

	}

	/**
	 * 
	 */

	private static void initMemory() {
		if (QiSConfig.ACTIVE_CACHE_MEMORY_QUESTIONNAIRE)
			questionnaireMemory = new DatabaseMemoryManager<Questionnaire>(dao.getQuestionnaireDAO(), 24 * 3600);

		customAnswerMemory = new CustomAnswerTable();

		for (Sport sp : Sport.values()) {
			if (customAnswerMemory.getTable(false).get(sp).size() <= 0) {
				log.fatal("Aucune réponses personnalisé n'a était enregistré pour le sport " + sp + " en valeur true");
				throw new Error();
			}
			if (customAnswerMemory.getTable(false).get(sp).size() <= 0) {
				log.fatal("Aucune réponses personnalisé n'a était enregistré pour le sport " + sp + " en valeur false");
				throw new Error();
			}
		}

		System.gc();
	}
}

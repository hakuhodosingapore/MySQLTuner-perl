----- MySQLTuner-perl -----

MySQLTuner это скрипт, написанный на Perl, который позволяет быстро произвести осмотр текущего состояния сервера баз данных MySQL 
и составить рекомендации для увеличения производительности и стабильности работы. Выводятся текущие параметры конфигурации 
и информация о состоянии в формате отчета с основными подсказками по оптимизации.

Совместимость:
	* MySQL 3.23, 4.0, 4.1, 5.0, 5.1 (полная поддержка)
	* MySQL 5.4 (оттестировано не полностью, частичная поддержка)
	* MySQL 6.0 (частичная поддержка)
	* Perl 5.6 или более поздний
	* Операционная система семейства Unix/Linux (протестировано на Linux, различных вариациях BSD и Solaris)
	* Windows не поддерживается на данное время
	* Неограниченный доступ на чтение для MySQL-сервера (Для работы с MySQL < 5.0 требуется root-доступ к серверу)

Пожалуйста, прочитайте раздел ЧаВо, который расположен чуть ниже.

*ПРЕДУПРЕЖДЕНИЕ*
	Очень важно, чтобы вы имели представление о том, какие изменения вы 
        вносите в параметры сервера баз данных MySQL. Если вы даже частично
        не понимаете вывод отчета скрипта, или не понимаете рекомендации, 
        которые делает скрипт, то вам лучше всего обратиться за помощью либо
        к документации к серверу баз данных, либо ближайшему системному 
        администратору. Всегда проверяйте ваши изменения на тестовом сервере 
        и всегда будьте готовы к тому, что улучшения в одной области могут иметь
        отрицательный эфект в работе MySQL в другой области.
	
	Серьезно - прочитайте раздел ЧаВо, который расположен чуть ниже.
*ПРЕДУПРЕЖДЕНИЕ*

----- Загрузка/Установка -----

You can download the entire repository by using 'git clone' followed by the cloning URL above.  The simplest and shortest method is:

	wget mysqltuner.pl
	perl mysqltuner.pl
	
Of course, you can add the execute bit (chmod +x mysqltuner.pl) so you can execute it without calling perl directly.

----- ЧаВо -----

Вопрос: Will MySQLTuner fix my slow MySQL server?

Literally - no.  MySQLTuner is a read only script.  It won't write to any configuration files, change the status of any daemons, or call your mother to wish her a happy birthday.  It will give you an overview of your server's performance and make some basic recommendations about improvements that you can make after it completes.  Make sure you read the warning above prior to following any recommendations.

Вопрос: Can I fire my DBA now?

MySQLTuner will not replace your DBA in any form or fashion.  If your DBA constantly takes your parking spot and steals your lunch from the fridge, then you may want to consider it - but that's your call.

Вопрос: Why does MySQLTuner keep asking me the login credentials for MySQL over and over?

The script will try its best to log in via any means possible.  It will check for ~/.my.cnf files, Plesk password files, and empty password root logins.  If none of those are available, then you'll be prompted for a password.  If you'd like the script to run in an automated fashion without user intervention, then create a .my.cnf file in your home directory which contains:

	[client]
	user=someusername
	pass=thatuserspassword
	
Once you create it, make sure it's owned by your user and the mode on the file is 0600.  This should prevent the prying eyes from getting your database login credentials under normal conditions.  If a T-1000 shows up in a LAPD uniform and demands your database credentials, you won't have much of an option.

Вопрос: It's not working on my OS! What gives?!

These kinds of things are bound to happen.  Here are the details I need from you in order to research the problem thoroughly:

	* OS and OS version
	* Architecture (x86, x86_64, IA64, Commodore 64)
	* Exact MySQL version
	* Where you obtained your MySQL version (OS package, source, etc)
	* The full text of the error
	* A copy of SHOW VARIABLES and SHOW GLOBAL STATUS output (if possible)

Once you get those, join the Google Group and drop your issue to the list:

	http://groups.google.com/group/mysqltuner-talk
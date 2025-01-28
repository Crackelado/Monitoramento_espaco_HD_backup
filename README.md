# Monitoramento_espaco_HD_backup
Script, do terminal, para monitorar espaço ocupado e espaço livre nos HD's de backup do servidor.

Utilizo bastante para identificar se não está muito cheio e comprometendo os backups. Como não enche rapidamente, programei o "crontab" (ferramenta de agendador de tarefas) do Ubuntu para executar toda segunda-feira e terça-feira. No script há uma cláusula para executar somente na primeira segunda-feira e terça-feira do mês corrente.

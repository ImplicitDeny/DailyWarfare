waitUntil { !isNil {player} };
waitUntil { player == player };
  
  
switch (side player) do 
{
	
	case WEST: // BLUFOR briefing goes here
	{
		player createDiaryRecord ["Diary", ["Crédits", "Mission réalisée par la team La Muerta<br/>
		Nous tenons à remercier :<br/>
		- Advanced Rappeling by Duda<br/>
		- Advanced Urban Rappeling by Duda<br/>
		- Enhanced Movement (babe) by Bad Benson<br/>
		- BG WeaponFramework by Kerc Kasha<br/>
		- Incon Effects Mod by Incontinentia<br/>
		- Knock on Tank by [JTFS] Bridge.J<br/>
		- CHange View Distance (CHVD) addon version by Champ-1<br/>
		- Dynamic Movement (dynmov) by Gole<br/>
		- G.O.S Quick Mount by G.O.S KiTooN<br/>
		- Kimi's HMD by Kimi<br/>
		- igiLoad addon version by [LM] Cheitan (original script by Igi_PL)<br/>
		- L_mount by Laxemann<br/>
		- Lesh Tow mod by leshrack<br/>
		- LM inspect by Cheitan (original anims and functions by Bnae)<br/>
		- PA Vehicles Doors and Lights by Pancake<br/>
		- Advanced Towing by Duda<br/>
		- Advanced Sling Loading by Duda<br/>
		- Stars Editor addon by Star (signed by Cheitan)<br/>
		- Unfoldable Map by Rall3n<br/>
		- BackpackOnChest by Zade<br/>
		- Unit SFX by mistergoodson and Lordprimate<br/>
		- Fuel consumption by Shiragami<br/>
		- ADV ACE CPR by Belbo<br/>
		- Walkable Moving Objects by Bloodwyn<br/>
		- MRB Air Visibility by Mr Burns<br/>
		- VSM Mods by VanSchmoozin, Specter, ArdvarkDB, Sabre, RoadRunner, Mindas, Deathsruck, CGartStudio<br/>
		- Specialist Military Arms by SMA Project Team (http://smaproject.com/)<br/>
		- Les membres de La Muerta pour le contenu réalisé<br/>
		Bon jeu à tous !"]];
		
		player createDiaryRecord ["Diary", ["Mods",
		"Mods nécessaires :<br/>
		<br/>
		CBA v3.4.0<br/>
		ACE3 v3.10.2<br/>
		ACEX v3.2.0<br/>
		Task Force Arrowhead Radio v0.9.12<br/>
		LMW_v3.0<br/>
		LM_Arsenal_v0.1<br/>
		LMG_v1.0<br/>"]];
		
		player createDiaryRecord ["Diary", ["Règles du serveur ArmA 3", 
		"Nous basons notre jeu sur de la coopération avec une base d’infanterie et toujours dans la bonne humeur. Pour ce faire, nous demandons à chacun de respecter ces quelques règles :<br/>
		<br/>
		1 – Rejoindre notre serveur TeamSpeak car nous jouons avec le mod TFR, qui déploie un système de radio complet et réaliste.<br/>
		2 – Chez nous le respawn des véhicules est limité. Alors on les utilise avec intelligence, on les rafistole et surtout on en prend soin.<br/>
		3 – Le respawn individuel ne s’effectue que sur ordre du Commandement TL ou SL. Nous avons mis en place un coma systématique. Si votre groupe est HS, le commandement enverra une unité médicale ou un autre groupe vous secourir.<br/>
		4 – Respecter la hiérarchie :<br/> 
		- Commandement<br/>
		- Team leader<br/>
		- Squad leader<br/>
		- Après c’est la courte paille.<br/>
		5 – Respecter le rôle que vous avez choisi. Chaque rôle sur notre serveur à une utilité et une fonction.<br/>
		6 – Seul le jeu en équipe est autorisé.<br/>
		7 – Restez poli et courtois en toutes circonstances.<br/>
		8 – Surtout amusez-vous !<br/>
		<br/>
		Tout manquement à l'une de ces règles pourra faire l’objet d’un avertissement, d’une éjection de notre serveur, voire d’un bannissement plus ou moins long."]];
		
		player createDiaryRecord ["Diary", ["Règles du TS", 
		"Le logiciel TeamSpeak est un composant essentiel de notre configuration de jeu, car il nous permet de communiquer lors de nos parties, mais aussi lors de nos réunions mensuelles, et en dehors du jeu.<br/>
		Son utilisation s’accompagne de quelques règles simples:<br/>
		<br/>
		1 – Dire bonjour en arrivant.<br/>
		2 – Pour chaque nouvel arrivant, une brève présentation sera de mise.<br/>
		3 – Le langage doit être correct. Pas d’insultes, ni de mauvais esprit.<br/>
		4 – Le flood, les brailleries ne sont pas tolérés.<br/>
		5 – Calme et écoute, le TFR donne une nouvelle dimension de jeu qui peut perturber. Nous vous demanderons de ne pas crier à la panique, un membre [LM] prendra le temps de vous aider si nécessaire.<br/>
		6 – Les différents canaux de TS doivent impérativement être respectés.<br/>
		7 – Vous devez respecter ce que vous demandent les membres [LM].<br/>
		<br/>
		En cas de manquement à ces règles, le premier avertissement se fera verbalement, le second sera un kick et enfin, en dernier recours, un bannissement temporaire ou permanent sera appliqué selon la gravité de la faute.<br/>
		<br/>
		Attention : Toute insulte fera l’objet d’une sanction appropriée et immédiate.<br/>
		<br/>
		BAN : Un ban sur le TS entraîne forcément une impossibilité de jouer sur nos serveurs étant donné que la présence sur le TS est obligatoire. Le seul recours en cas de ban du TS est un écrit sur notre forum dans la section BANLIST / le sujet correspondant à votre pseudonyme. La raison de votre ban sera clairement expliqué. Vous pourrez poster une réponse et faire une demande en vue de supprimer le ban. Cette demande sera étudiée dans les meilleurs délais par nos soins.<br/>
		<br/>
		Nous jouons avec TFR, prônons la cohésion et le jeu d’équipe mais toujours dans la bonne humeur."]];
		
		player createDiaryRecord ["Diary", ["Nos Outils", 
		"Informations sur les outils de la Team LaMuerta [LM]<br/><br/>
		Teamspeak : ts3.lamuerta.fr<br/>
		Serveur Arma 3 : arma3.lamuerta.fr<br/>
		Forum :	forum.lamuerta.fr<br/>
		Site web :	www.lamuerta.fr<br/>
		Wiki :	wiki.lamuerta.fr<br/>"]];
	};
	
	case EAST: // REDFOR briefing goes here
	{		
	};
	
	
	case RESISTANCE: // RESISTANCE/INDEPENDENT briefing goes here
	{		
	};
	
	
	case CIVILIAN: // CIVILIAN briefing goes here
	{		
	};
};
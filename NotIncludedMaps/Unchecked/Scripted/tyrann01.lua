--@Mapeditor: Peter Wiem
--@Scripter: Spikeone
title0="Tagebuch des Quintus"
title1="Bericht der Sp�her"
------------------------------------------------------------ <- L�nge
msg0="Tagebuch des Quintus: 1. Eintrag am 3. M�rz\n\nBis jetzt scheinen wir unentdeckt geblieben zu sein. Das ist\n hier aber auch ein verschwiegenes Pl�tzchen. Gut, dass unser\nSteuermann hier die Gegend so gut zu kennen scheint. Dann\nrichten wir uns erst einmal hier ein."
msg1="Tagebuch des Quintus: 2. Eintrag am 4. M�rz\n\nEs wurde uns vom Kapit�n der 'Markomannia' mitgeteilt, das in dieser Gegend das Schiff gesichtet worden ist, welches in Venezia vor Anker lag, als der Raub geschah. Unserem geliebten Konsul Tyrannus Rex wurde seine R�stung aus seiner Schatzkammer entwendet.\nAls er sich von seinem Schreck erholt hatte, befahl er mir, die R�stung wieder zu beschaffen und all das daran beteiligte Diebesgesindel unsch�dlich zu machen. Als ob das so einfach w�re! Gl�cklicherweise gab er mir als seinem Verwalter s�mtliche Vollmachten �ber seine Untertanen und seine Besitzungen. Ich kann mir also bei Bedarf Schiffe und geeignete Leute heraussuchen, die mir bei der Verfolgung der Diebe und bei der Wiederbeschaffung dieser unsersetzlichen R�stung behilflich sein k�nnen."
msg2="Tagebuch des Quintus: 3. Eintrag am 6. M�rz\n\nGut, dass mein Spion so fix gearbeitet hat, als sich die Kunde von dem Raub verbreitet hat. Er hat nicht nur den Namen des Schiffes erfahren, dass nach dem Raub so schnell Richtung S�dwest abreiste, sondern auch in einer Hafenkneipe das vorl�ufige Ziel der Schifffahrt erlauscht. Deshalb waren wir innerhalb achtundvierzig Stunden reisefertig und sind mit der Dreimastbark 'Gloria' unseres Konsuls ebenfalls in diese Richtung gesegelt. Gl�cklicherweise trafen wir vor vier Tagen die 'Markomannia', deren Kapit�n uns auf diese Spur setzte. Dann fanden wir diese versteckte Anlegestelle und beschlossen, hier unsere Nachforschungen zu beginnen."
msg3="Tagebuch des Quintus: 4. Eintrag am 8. M�rz\n\nMein Steuermann versicherte mir, nie mehr mit einer Dreimastbark solch eine Schiffsreise unternehmen zu wollen. Auch mir war nicht wohl zumute, als wir mit unserem Riesenschiff die letzten Meter bis zu diesem Platz man�veriert sind. Eine Dreimastbark ist das richtige Schiff, wenn unser geliebter Konsul in Venezia vom Plaza San Marco zum Lido flanieren will. Da hat unsere 'Gloria' richtig was hergemacht. Aber hier w�re sie zu auff�llig und viel zu unbeweglich. Deshalb haben wir sie zerlegt und alles Brauchbare zur Wiederverwendung gelagert. Auf dem Weg hierher sind uns die einheimischen Schiffe begegnet, die mit einem Bruchteil der Besatzung einer Dreimastbark gesegelt werden k�nnen. Die sind hier richtig. Die eingesparten Leute k�nnen wir anderweitig gut gebrauchen."
msg4="Tagebuch des Quintus: 5. Eintrag am 9. M�rz\n\nEine sumpfige Gegend ist das hier! Wir m�ssen uns in jeder Hinsicht hier vorsichtig bewegen. Aber Wild und Fische scheint es hier reichlich zu geben. Da ich um den guten Appetit unsrer Bergbauer weiss, sollten wir uns mit Nahrungsmittel reichlich versehen. Wer weiss, ob man hier �berhaupt Getreide anpflanzen kann?"
msg5="Tagebuch des Quintus: 6. Eintrag am 12. M�rz\n\nWir haben das Zelt eines Einheimischen getroffen! Er lebt hier als Fallensteller und Sch�tze und hat eine au�erordentliche Begabung, wenn es um das Herstellen von Werkzeug geht. Wir fanden bei ihm 5 B�gen, 5 �xte und 5 Pickel. Ausserdem hat er sich einen gr�sseren Vorrat von Schinken (20 St�ck) angelegt, den er aber gerne mit uns teilen m�chte.\nEr erz�hlte uns, dass in den letzten Monaten wiederholt nubische R�uberbanden die Gegend hier unsicher gemacht haben. Deshalb w�re er froh, wenn er sich uns anschliessen k�nnte.\nAusserdem habe er vor etwa zwei Wochen auf dem h�chsten Berg in diesem Gebiet ein grosses Feuer brennen sehen, was stets ein Versammlungszeichen dieser Banden darstelle. Dieser Berg liegt im S�dwesten, sei aber �usserst unzug�nglich und von H�hlen durchzogen."
msg6="Tagebuch des Quintus: 7. Eintrag am 13. M�rz\n\nJetzt haben wir genug erfahren, um zu wissen, was zu tun ist! Zuerst einmal werden wir unsere Wirtschaft auf Vordermann bringen, damit wir im Falle eines Zusammentreffens mit diesen R�uberbanden stets eine passende Antwort bereit haben. Dann werden wir uns diesen Berg einmal genauer besehen, um dort die vorhandenen Spuren oder gar ein m�gliches Versteck genauer zu besehen. Und Drittens werden wir die Gegend mit unseren neu gebauten Schiffen untersuchen, um uns ein genaues Bild machen zu k�nnen. Bei allem m�ssen wir sehr vorsichtig sein, weil wir nicht um die Anzahl und die St�rke dieser R�uberbanden wissen."
exp0="Bericht der Sp�her\n\nDieser Sumpf ist hier tats�chlich unpassierbar. Wir m�ssen umkehren und uns einen anderen Weg suchen. Aber vorher schauen wir uns noch die Berge an Ort und Stelle an, ob sie nichts Verwertbares f�r uns bereithalten."
exp1="Bericht der Sp�her\n\nDas war eine Kletterei! Die Spuren hier lassen auf mehrere R�uberbanden schliessen, die hier ihre Zusammenk�nfte abhalten. Ausserdem ist der Boden voller Goldstaub, wir m�ssen also genauer nachsehen, was es aus dem Berg zu holen gibt. Und hier ist tats�chlich eine H�hle und darin - Hurra! - die Schuhe unseres Konsuls. Ausserdem fanden wir noch einige Pl�ne und schriftliche Unterlagen. Leider ist unser 'Schriftgelehrter' im Hauptquartier geblieben, so dass wir die zweifellos nubischen Texte noch nicht entziffern k�nnen."

rttr.Log("Mission script started!")
state = 0

function onGameFrame(gf)
	--
	if(gf%20) ~= 0then
		return
	end
	--
	if(state==0) then
		if(gf>150) then
			rttr.MissionStatement(0,title0,msg0)
			state=1
		end
	end
	--
	if(state==1) then
		if((rttr.GetBuildingCount(0,BLD_BARRACKS)>0) or (rttr.GetBuildingCount(0,BLD_GUARDHOUSE)>0) or (rttr.GetBuildingCount(0,BLD_WOODCUTTER)>0) or (rttr.GetBuildingCount(0,BLD_FISHERY)>0) or (rttr.GetBuildingCount(0,BLD_QUARRY)>0) or (rttr.GetBuildingCount(0,BLD_FORESTER)>0) or (rttr.GetBuildingCount(0,BLD_HUNTER)>0)) then
			rttr.MissionStatement(0,title0,msg1)
			state=2
		end
	end
	--
	if(state==2) then
		if (rttr.GetBuildingCount(0,BLD_SAWMILL)>0) then
			rttr.MissionStatement(0,title0,msg2)
			state=3
		end
	end
	--
	if(state==3) then
		if(rttr.GetBuildingCount(0,BLD_HARBORBUILDING)>0) then
			rttr.MissionStatement(0,title0,msg3)
			state=4
		end
	end
	--
end


function onExplored(p,x,y)
	if(state==4) then
		if(p==0 and x>48 and x<55 and y>57 and y<65) then
			state=5
			rttr.MissionStatement(0,title0,msg4)
		end
	end

	if(state==5) then
		if(p==0 and x==46 and y==53) then
			rttr.MissionStatement(0,title0,msg5)
			state=6
		end
	end

	if(state==6) then
		if(p==0 and x>24 and x<36 and y>33 and y<45) then
			rttr.MissionStatement(0,title0,msg6)
			state=7
		end
	end

	if(state==7) then
		if(p==0 and x>59 and x<63 and y>13 and y<32) then
			rttr.MissionStatement(0,title1,exp0)
			state=8
		end
	end

	if(state==8) then
		if(p==0 and x==80 and y==80) then
			rttr.MissionStatement(0,title1,exp1)
			state=9
		end
	end
end
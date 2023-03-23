--@Mapeditor: Peter Wiem
--@Scripter: Spikeone
title0="Tagebuch des Quintus"
title1="Bericht der Späher"
------------------------------------------------------------ <- Länge
msg0="Tagebuch des Quintus: 1. Eintrag am 3. März\n\nBis jetzt scheinen wir unentdeckt geblieben zu sein. Das ist\n hier aber auch ein verschwiegenes Plätzchen. Gut, dass unser\nSteuermann hier die Gegend so gut zu kennen scheint. Dann\nrichten wir uns erst einmal hier ein."
msg1="Tagebuch des Quintus: 2. Eintrag am 4. März\n\nEs wurde uns vom Kapitän der 'Markomannia' mitgeteilt, das in dieser Gegend das Schiff gesichtet worden ist, welches in Venezia vor Anker lag, als der Raub geschah. Unserem geliebten Konsul Tyrannus Rex wurde seine Rüstung aus seiner Schatzkammer entwendet.\nAls er sich von seinem Schreck erholt hatte, befahl er mir, die Rüstung wieder zu beschaffen und all das daran beteiligte Diebesgesindel unschädlich zu machen. Als ob das so einfach wäre! Glücklicherweise gab er mir als seinem Verwalter sämtliche Vollmachten über seine Untertanen und seine Besitzungen. Ich kann mir also bei Bedarf Schiffe und geeignete Leute heraussuchen, die mir bei der Verfolgung der Diebe und bei der Wiederbeschaffung dieser unsersetzlichen Rüstung behilflich sein können."
msg2="Tagebuch des Quintus: 3. Eintrag am 6. März\n\nGut, dass mein Spion so fix gearbeitet hat, als sich die Kunde von dem Raub verbreitet hat. Er hat nicht nur den Namen des Schiffes erfahren, dass nach dem Raub so schnell Richtung Südwest abreiste, sondern auch in einer Hafenkneipe das vorläufige Ziel der Schifffahrt erlauscht. Deshalb waren wir innerhalb achtundvierzig Stunden reisefertig und sind mit der Dreimastbark 'Gloria' unseres Konsuls ebenfalls in diese Richtung gesegelt. Glücklicherweise trafen wir vor vier Tagen die 'Markomannia', deren Kapitän uns auf diese Spur setzte. Dann fanden wir diese versteckte Anlegestelle und beschlossen, hier unsere Nachforschungen zu beginnen."
msg3="Tagebuch des Quintus: 4. Eintrag am 8. März\n\nMein Steuermann versicherte mir, nie mehr mit einer Dreimastbark solch eine Schiffsreise unternehmen zu wollen. Auch mir war nicht wohl zumute, als wir mit unserem Riesenschiff die letzten Meter bis zu diesem Platz manöveriert sind. Eine Dreimastbark ist das richtige Schiff, wenn unser geliebter Konsul in Venezia vom Plaza San Marco zum Lido flanieren will. Da hat unsere 'Gloria' richtig was hergemacht. Aber hier wäre sie zu auffällig und viel zu unbeweglich. Deshalb haben wir sie zerlegt und alles Brauchbare zur Wiederverwendung gelagert. Auf dem Weg hierher sind uns die einheimischen Schiffe begegnet, die mit einem Bruchteil der Besatzung einer Dreimastbark gesegelt werden können. Die sind hier richtig. Die eingesparten Leute können wir anderweitig gut gebrauchen."
msg4="Tagebuch des Quintus: 5. Eintrag am 9. März\n\nEine sumpfige Gegend ist das hier! Wir müssen uns in jeder Hinsicht hier vorsichtig bewegen. Aber Wild und Fische scheint es hier reichlich zu geben. Da ich um den guten Appetit unsrer Bergbauer weiss, sollten wir uns mit Nahrungsmittel reichlich versehen. Wer weiss, ob man hier überhaupt Getreide anpflanzen kann?"
msg5="Tagebuch des Quintus: 6. Eintrag am 12. März\n\nWir haben das Zelt eines Einheimischen getroffen! Er lebt hier als Fallensteller und Schütze und hat eine außerordentliche Begabung, wenn es um das Herstellen von Werkzeug geht. Wir fanden bei ihm 5 Bögen, 5 Äxte und 5 Pickel. Ausserdem hat er sich einen grösseren Vorrat von Schinken (20 Stück) angelegt, den er aber gerne mit uns teilen möchte.\nEr erzählte uns, dass in den letzten Monaten wiederholt nubische Räuberbanden die Gegend hier unsicher gemacht haben. Deshalb wäre er froh, wenn er sich uns anschliessen könnte.\nAusserdem habe er vor etwa zwei Wochen auf dem höchsten Berg in diesem Gebiet ein grosses Feuer brennen sehen, was stets ein Versammlungszeichen dieser Banden darstelle. Dieser Berg liegt im Südwesten, sei aber äusserst unzugänglich und von Höhlen durchzogen."
msg6="Tagebuch des Quintus: 7. Eintrag am 13. März\n\nJetzt haben wir genug erfahren, um zu wissen, was zu tun ist! Zuerst einmal werden wir unsere Wirtschaft auf Vordermann bringen, damit wir im Falle eines Zusammentreffens mit diesen Räuberbanden stets eine passende Antwort bereit haben. Dann werden wir uns diesen Berg einmal genauer besehen, um dort die vorhandenen Spuren oder gar ein mögliches Versteck genauer zu besehen. Und Drittens werden wir die Gegend mit unseren neu gebauten Schiffen untersuchen, um uns ein genaues Bild machen zu können. Bei allem müssen wir sehr vorsichtig sein, weil wir nicht um die Anzahl und die Stärke dieser Räuberbanden wissen."
exp0="Bericht der Späher\n\nDieser Sumpf ist hier tatsächlich unpassierbar. Wir müssen umkehren und uns einen anderen Weg suchen. Aber vorher schauen wir uns noch die Berge an Ort und Stelle an, ob sie nichts Verwertbares für uns bereithalten."
exp1="Bericht der Späher\n\nDas war eine Kletterei! Die Spuren hier lassen auf mehrere Räuberbanden schliessen, die hier ihre Zusammenkünfte abhalten. Ausserdem ist der Boden voller Goldstaub, wir müssen also genauer nachsehen, was es aus dem Berg zu holen gibt. Und hier ist tatsächlich eine Höhle und darin - Hurra! - die Schuhe unseres Konsuls. Ausserdem fanden wir noch einige Pläne und schriftliche Unterlagen. Leider ist unser 'Schriftgelehrter' im Hauptquartier geblieben, so dass wir die zweifellos nubischen Texte noch nicht entziffern können."

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
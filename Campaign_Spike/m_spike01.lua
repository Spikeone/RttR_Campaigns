function getRequiredLuaVersion()
    return 1
end

rttr:RegisterTranslations(
{
    en =
    {
        nameAI = 'Unknown faction',
        textLogbook = 'In the logbook you will find information about the current task(s).',
    
        salvageCoal = 'There were 20 coal salvaged',

        lookhere = 'Place of the event',

        tasks_main = "Main objective(s):",
        tasks_sub = "Secondary objective(s):",
        tasks_hint = "[?] = Hidden or undiscovered objective\n[ ] = Objective not yet completed\n[+] = Objective was completed",
        tasks_legend = "Legend:",

        task1_1 = "[ ] Catch up with the thief",
        task1_2 = "[ ] Defeat the guards and search the camp",
        task1_3 = "[+] Follow the thief north (next mission)",

        task2_1 = "[ ] Dismantle the ships",
        task2_2 = "[+] The ships were dismantled",

        task3_101 = "[ ] Build at least two samills",

        task4_101 = "[ ] Explore further",
        
        task5_1 = "[ ] Recruit a larger army",
        task5_2 = "[+] The army is growing",

        task6_101 = "[ ] Search for food source",
        task6_102 = "[ ] Find a way to get fish from the fishing village",
        task6_103 = "[+] The fishing village became friends",
        task6_104 = "[+] The fishing village was looted",

        task7_101 = "[ ] Brew beer",
        task7_102 = "[+] Beer is brewed",

        task8_101 = "[ ] Find and mine traces of iron",
        task8_102 = "[+] Iron is mined",

        task9_101 = "[ ] Build iron smelting and armory",
        task9_102 = "[+] Weapons can be forged",

        task10_101 = "[ ] Build a harbor for supplies",
        task10_102 = "[+] Replenishment was delivered",

        task11_101 = "[ ] Find more charcoal",

        title   = 'The Chase',

        title2  = 'Commanding officer\'s log',

        msg1    = 'The king has sent me out to catch a thief. Allegedly,\na ring was stolen from his private property. I\nfollowed the suspect to this remote country where I\nsaw his destroyed ship lying on the coast. Our ship\nalso ran aground next to it and we were on our own.\nSome important tools that would have been useful in\nthis endeavor are now lying at the bottom of the sea.\n\nI still don\'t know why I am being sent for a single\nstolen ring. This task is far below my abilities, I\nwonder if there is more to it.\n\nNow is not the time to brood over it, we need some\nconstruction material to start the pursuit. For this\nwe can dismantle the old ships and process them into\nvaluable building material.',
        msg2    = 'Now we have some resources to quickly follow the\nthief. I used the time to look around a bit. I could\ndiscover some traces of destroyed buildings. This\ntrace leads to the west. The ash is still warm. I am\nconfident that this task will be completed quickly.',
        msg3    = 'There was a camp here not long ago. However, the\nfires have been extinguished for a long time. I\nfollowed the trail in the wrong direction, to the\neast the tracks must be fresher. Fortunately, some\ntools were left behind. With their help, I can create\nnew trails to make faster progress. I will send some\nof my men out to retrieve the tools.\n\nUntil then, I should keep looking in the east.',
        msg4    = 'Fallen trees and tracks. A larger group has passed\nthrough here. I am now sure that the way east is the\nright one. From the tracks I can\'t tell exactly how\nbig the unit itself is. I should proceed carefully so\nas not to be surprised in the dense forest.\n\nThe tools have finally arrived at our camp. Improving\nthe transport routes should have top priority. But\nperhaps this land offers more than meets the eye at\nfirst.\n\nWe have also been able to extract some charcoal from\nthe burned buildings. Even if we don\'t need it at the\nmoment, we should collect every raw material that is\navailable to us.',
        msg5    = 'A looted farm? We can\'t help the former inhabitants\nand I can\'t find any bodies. Perhaps they were able\nto escape before something worse happened to them.\n\nTo devastate a royal farm in such a short time\nrequires a good number of men. I really need to build\nup a small army to avoid being overrun myself.\nFortunately for us, the fields are still tilled and\nwe can use the wheat. We cannot gain enough to\nproduce food, but we should be able to brew a little\nbeer. The land seems very dry, I don\'t know how\nproductive our low wells are.\n\nSince we only went out light, we don\'t have the\nproper tools for geological exploration. I hope we\ncan find traces of iron, a few picks for miners we\ncould secure. The work in the mines is arduous, we\nneed to find a source of food.',
        msg6    = 'The trail has become cold by now, we are too slow.\nHere there is nothing but mountains as far as the eye\ncan see. At the fork in the trail we have to decide\nin which direction to continue.',
        msg7    = 'From a distance I could see a fisherman on the shore.\nHe seems to have noticed me, but paid me no further\nattention. His small fishing village seems to be\nneutral towards us. Neither we are welcomed with open\narms nor pursued with swords.\n\nMaybe there is a possibility to secure the food\nsupply in one way OR the other.',
        msg8    = 'The fishing village is probably interested, but not\non the terms offered. They want a permanent security\nthat we will not raid them.',
        msg9    = 'When I revealed myself as the king\'s commander, the\njoy in the fishing village was great. Although I have\nthe feeling that something unspoken is in the air.\nHowever, for my task the concerns of the peasant\nbumpkins are not important.\n\nGenerously we received a delivery of fish which was destined for the markets in Serdica. Since the last winter has been particularly mild, they have left us some charcoal. These raw materials bring me closer to the fulfillment of my task.',
        msg10   = 'When I revealed myself as the king\'s commander, the\nfear in the fishing village was great. Some of these\npeasant louts took up arms, but they were not a\nserious challenge.\n\nWe seized a shipment of fish destined for the markets\nin Serdica. We also managed to extract some charcoal\nfrom the remains of the buildings. These raw\nmaterials bring me closer to the fulfillment of my\ntask.',
        msg11   = 'These bandits have advanced technologies. However,\nthe device does not seem to be operational yet. From\nwhom could they capture such advanced plans?\n\nPerhaps the king was right to entrust me with this\ntask. I must proceed with caution.',
        msg12   = 'The thief was not hiding here. Overall, the camp did\nnot look like that of a bandit group. I could not\nlocate any stolen treasure. Also, the armament was\nmore like that of normal peasants than bandits.\n\nEven though we couldn\'t salvage much from the flames,\nthe extinct buildings provided some charcoal.',
        msg13   = 'With this iron we could make weapons. Since there is\nno coal in the mountains, we have to make do with\ncharcoal from burned buildings.',
        msg14   = 'The first sip of beer on this trip, a real relief.\nThe morale of my men will be unbroken and we can\ntrain some new recruits. If only drinks were always\navailable iced. A magic cupboard where it\'s cold. I\nguess that\'s the beer talking\n\n*hiccups*',
        msg15   = 'Now we can produce tools, tools of war. A constant\nsupply of iron and coal is important to keep the\nforge fire going. Also the beer should not be\nforgotten.',
        msg16   = 'Soon we will be able to add new recruits to our\nranks. These bandits can oppose me all they want, but\nin the end I will win.\n\nI\'m beginning to like this job. Normally, I only take\ncare of the troops, not the infrastructure.',
        msg17   = 'What a beautiful bay. The ruin shows that the thief\nmust have landed here and the ship just drifted. I\nshould build a harbor and establish a supply line.',
        msg18   = 'It looks like I will not receive the expected\nsupport. The king has only provided me with a\ncontubernium. Moreover, he finds fault with the fact\nthat the task has not yet been completed and that I\nhave wasted valuable time building a harbor instead.\nI must hurry, no one has yet survived the wrath of\nthe ruler.',
        msg19   = 'These bandits look very rich. The thief probably came\nthis way and paid them handsomely to get passage. I\nhave to be careful, many swords can be hired for the\nright pay. There may be another route I could take.',
        msg20   = 'As much as I tortured the prisoners, they could tell\nme little about a thief. He doesn\'t seem to have come\nthis way. In the end, is it true that these peasants\nmerely had some luck and struck gold? Even if they\nhad, they would have had to cooperate with a\ncommander of the king.\n\nAt least I was able to secure some coal and a few\ngold coins.',
        msg21   = 'This is the thief\'s camp! Finally, the fulfillment of\nmy task is near. I must destroy it and catch the\nthief. The king demands that I hand him over alive.\n\nIt looks like they have partially rebuilt the\nwatchtowers. The fortifications have not been manned\nfor a long time, since the north has been subdued.\nHardly a soul can survive in the barren mountains.',
        msg22   = 'A large amount of weapons were made here. This is the\norigin of the markings for iron that we could\ndiscover again and again on our way. Apparently they\nonly removed the upper, quickly accessible layers.\nFortunately, we were fast enough and they could not\nupgrade any farmers with the weapons.',
        msg23   = 'We\'ve turned over every stone in this damn place and\nfound no trace. The thief must have simply fled to\nthe north. He must continue to carry the ring with\nhim because there is no trace of it either. With our\nequipment, however, we can\'t follow into the cold of\nthe north. The ashcord mountain is treacherous and\nnotorious for the disappearance of unwary hikers.',
        msg24   = 'Looks like a pagan ritual. I wonder what was\nsacrificed here. Man, animal or even both. Let the\npeasants believe what they want, I believe in the\nstrength of my sword arm.',
        msg25   = 'Another looted camp. These animals will stop at\nnothing. Here, too, there are no bodies to be found -\nor they are buried under the rubble.',
        msg26   = 'What happened here. Actually, there should be a small\nguard post here. Is the thief\'s unit so big that they\ncan overrun a royal garrison? There are no bodies\nhere either.',
        msg27   = 'Hauling the material up the mountains is arduous and\ntakes a lot of time. i should make some improvements\nand set up camps along the way. This should allow me\nto move faster and give me a tactical advantage.',

        hosttitle = 'Important',
        hosthint = 'Please check the addon settings. You are allowed to change some of them. This may result in a difficulty change which leads to a different experience than expected.\n\n\nReport any bugs you encounter!\n'
    },
    de =
    {
        nameAI = 'Unbekannte Fraktion',

        textLogbook = 'Im Logbuch finden sich Hinweise zur aktuellen Aufgabe(n).',
        salvageCoal = 'Es wurden 20 Kohle geborgen.',

        lookhere    = 'Ort des Geschehens',

        tasks_main  = "Hauptziel(e):",
        tasks_sub   = "Nebenziel(e):",
        tasks_hint  = "[?] = Verstecktes oder unentdecktes Ziel\n[ ] = Aufgabe noch nicht abgeschlossen\n[+] = Aufgabe wurde abgeschlossen",
        tasks_legend = "Legende:",

        task1_1 = "[ ] Den Dieb einholen",
        task1_2 = "[ ] Die Wachen besiegen und das Lager durchsuchen",
        task1_3 = "[+] Dem Dieb Richtung Norden folgen (Nächste Mission)",

        task2_1 = "[ ] Die Schiffe Zerlegen",
        task2_2 = "[+] Die Schiffe wurden zerlegt",

        task3_101 = "[ ] Mindestens zwei Sägemühlen bauen",

        task4_101 = "[ ] Weiter Erkunden",
        
        task5_1 = "[ ] Eine größere Armee rekrutieren",
        task5_2 = "[+] Die Armee wächst",

        task6_101 = "[ ] Nahrungsquelle suchen",
        task6_102 = "[ ] Einen Weg finden vom Fischerdorf Fisch zu erhalten",
        task6_103 = "[+] Das Fischerdorf wurde befreundet",
        task6_104 = "[+] Das Fischerdorf wurde geplündert",

        task7_101 = "[ ] Bier brauen",
        task7_102 = "[+] Bier wird gebraut",

        task8_101 = "[ ] Spuren von Eisen finden und abbauen",
        task8_102 = "[+] Eisen wird abgebaut",

        task9_101 = "[ ] Eisenschmelze und Schmiede bauen",
        task9_102 = "[+] Waffen können geschmiedet werden",

        task10_101 = "[ ] Einen Hafen bauen für Nachschub",
        task10_102 = "[+] Nachschub wurde geliefert",

        task11_101 = "[ ] Mehr Holzkohle finden",

        title   = 'Die Verfolgungsjagd',

        title2  = 'Logbuch des kommandierenden Offiziers',

        msg1    = 'Der König hat mich ausgesendet um einen Dieb zu\nstellen. Angeblich wurde ein Ring aus dem\nPrivatbesitz geraubt. Ich bin dem Verdächtigen bis in\ndieses abgelegene Land gefolgt wo ich sein zerstörtes\nSchiff an der Küste liegen sah. Auch unser Schiff ist\ndaneben auf Grund gelaufen und wir sind auf uns\nalleine gestellt. Einige wichtige Werkzeuge die bei\ndiesem Unterfangen nützlich gewesen wären liegen nun\nauf dem Grund des Meeres.\n\nIch weiß noch immer nicht warum ich für einen\neinzelnen gestohlenen Ring entsendet werde. Diese\nAufgabe liegt doch weit unter meinen Fähigkeiten, ich\nfrage mich ob mehr dahinter steckt.\n\nJetzt ist nicht der richtige Zeitpunkt um darüber zu\ngrübeln, wir benötigen etwas Baumaterial um die\nVerfolgung aufnehmen zu können. Dazu können wir die\nalten Schiffe zerlegen und zu wertvollem Baumaterial\nverarbeiten.',
        msg2    = 'Nun haben wir einige Ressourcen um dem Dieb schnell\nzu folgen. Ich habe die Zeit genutzt um mich ein\nwenig umzusehen. Ich konnte einige Spuren zerstörter\nGebäude entdecken. Diese Spur führt in den Westen.\nDie Asche ist noch warm. Ich bin zuversichtlich, dass\ndiese Aufgabe schnell erledigt ist.',
        msg3    = 'Hier befand sich noch vor kurzem ein Lager. Die Feuer\nsind jedoch schon lange erloschen. Ich bin der Spur\nin die falsche Richtung gefolgt, im Osten müssen die\nSpuren frischer sein. Glücklicherweise wurden einige\nWerkzeuge zurückgelassen. Mit deren Hilfe kann ich\nneue Pfade schaffen um schneller voran zu kommen. Ich\nwerde einige meiner Männer aussenden um die Werkzeuge\nzu bergen.\n\nBis dahin sollte ich im Osten weiter Ausschau halten.',
        msg4    = 'Umgestürzte Bäume und Spuren. Hier ist eine größere\nGruppe durchgezogen. Ich bin mir nun sicher, dass der\nWeg Richtung Osten der richtige ist. Anhand der\nSpuren kann ich nicht genau feststellen, wie groß die\nEinheit selbst ist. Ich sollte vorsichtig vorgehen um\nnicht im dichten Wald überrascht zu werden.\n\nDie Werkzeuge sind endlich in unserem Lager\nangekommen. Die Verbesserung der Transportwege sollte\noberste Priorität haben. Vielleicht bietet dieses\nLand aber noch mehr als das Auge zunächst offenlegt.\n\nWir haben außerdem etwas Holzkohle aus den\nabgebrannten Gebäuden gewinnen können. Auch wenn wir\ndiese derzeit nicht benötigen, so sollten wir doch\njeden Rohstoff sammeln der uns zur Verfügung steht.',
        msg5    = 'Eine geplünderte Farm? Wir können den einstigen\nBewohnern nicht mehr helfen und ich vermag auch keine\nLeichen ausfindig machen. Vielleicht konnten sie\nfliehen bevor ihnen schlimmeres widerfahren ist.\n\nUm einen königlichen Bauernhof in so kurzer Zeit\ndermaßen zu verwüsten ist eine ordentliche Mannstärke\nvonnöten. Ich muss unbedingt eine kleine Armee\naufbauen um nicht selbst übermannt zu werden. Zu\nunserem Glück sind die Felder noch bestellt und wir\nkönnen den Weizen nutzen. Zur Produktion von Nahrung\nkönnen wir nicht genügend gewinnen, ein wenig Bier\nsollten wir jedoch brauen können. Das Land wirkt sehr\ntrocken, ich weiß nicht wie ergiebig unsere niedrigen\nBrunnen sind.\n\nDa wir nur mit leichtem Gepäck ausgezogen sind, haben\nwir nicht die richtigen Werkzeuge für geologische\nUntersuchungen. Ich hoffe wir können Spuren von Eisen\nfinden, ein paar Spitzhacken für Bergarbeiter konnten\nwir sicherstellen. Die Arbeit in den Minen ist\nbeschwerlich, wir müssen eine Quelle für Nahrung\nfinden',
        msg6    = 'Die Spur ist mittlerweile kalt geworden, wir sind zu\nlangsam. Hier gibt es nichts als Berge soweit das\nAuge reicht. An der Weggabelung müssen wir uns\nentscheiden in welche Richtung wir weiter vordringen.',
        msg7    = 'Aus der Ferne habe ich einen Fischer am Ufer sehen\nkönnen. Er scheint mich bemerkt zu haben, schenkte\nmir aber keine weitere Beachtung. Sein kleines\nFischerdorf scheint uns neutral gegenüber zu stehen.\nWeder werden wir mit offenen Armen empfangen noch mit\nSchwertern verfolgt.\n\nVielleicht gibt es eine Möglichkeit auf dem Einen\nODER Anderen Weg die Nahrungsmittelversorgung\nsicherzustellen.',
        msg8    = 'Das Fischerdorf ist wohl interessiert, aber nicht zu\nden angebotenen Bedingungen. Sie wünschen sich eine\ndauerhafte Sicherheit, dass wir sie nicht überfallen\nwerden.',
        msg9    = 'Als ich mich als Kommandant des Königs zu erkennen\ngab war die Freude im Fischerdorf groß. Obwohl ich\ndas Gefühl habe, dass etwas unausgesprochenes in der\nLuft liegt. Für meine Aufgabe sind die Belange der\nBauernlümmel aber auch nicht weiter Wichtig.\n\nGroßzügig haben wir eine Lieferung Fisch erhalten\nwelche für die Märkte in Serdica bestimmt waren. Da\nder letzte Winter wohl besonders mild ausgefallen\nist, haben sie uns noch etwas Holzkohle überlassen.\nDiese Rohstoffe bringen mich der Erfüllung meiner\nAufgabe näher.',
        msg10   = 'Als ich mich als Kommandant des Königs zu erkennen\ngab war die Angst im Fischerdorf groß. Einige dieser\nBauernlümmel griffen zu den Waffen, sie waren aber\nkeine ernstzunehmende Herausforderung.\n\nWir haben eine Fischlieferung beschlagnahmt welche\nfür die Märkte in Serdica bestimmt waren. Außerdem\nhaben wir aus den Überresten der Gebäude etwas\nHolzkohle gewinnen können. Diese Rohstoffe bringen\nmich der Erfüllung meiner Aufgabe näher.',
        msg11   = 'Diese Banditen besitzen fortschrittliche\nTechnologien. Allerdings scheint das Gerät noch nicht\neinsatzfähig. Von wem konnten sie derart\nfortschrittliche Pläne erbeuten?\n\nVielleicht hat der König richtig entschieden mich mit\ndieser Aufgabe zu betrauen. Ich muss vorsichtig\nvorgehen.',
        msg12   = 'Der Dieb hat sich hier nicht versteckt. Insgesamt\nwirkte das Lager nicht wie das einer Banditen Gruppe.\nIch konnte keinen gestohlenen Schätze ausfindig\nmachen. Auch die Bewaffnung glich eher der von\nnormalen Bauern als Banditen.\n\nAuch wenn wir nicht viel aus den Flammen retten\nkonnten, so lieferten die erloschenen Gebäude etwas\nHolzkohle.',
        msg13   = 'Mit diesem Eisen könnten wir Waffen herstellen. Da es\nin den Bergen keine Kohle gibt müssen wir mit\nHolzkohle aus abgebrannten Gebäuden auskommen.',
        msg14   = 'Der erste Schluck Bier auf dieser Reise, eine wahre\nWohltat. Die Moral meiner Männer wird ungebrochen\nsein und wir können einige neue Rekruten ausbilden.\nWenn man doch nur immer Getränke eisgekühlt zur\nVerfügung hätte. Ein magischer Schrank in dem es kalt\nist. Da spricht wohl das Bier aus mir.\n\n*hicks*',
        msg15   = 'Jetzt können wir Werkzeuge herstellen,\nKriegswerkzeuge. Ein konstanter Nachschub an Eisen\nund Kohle ist wichtig um das Schmiedefeuer am laufen\nzu halten. Auch das Bier sollte nicht in\nVergessenheit geraten.',
        msg16   = 'Bald schon werden wir neue Rekruten in unsere Reihen\naufnehmen können. Diese Banditen können sich mir\nentgegen stellen wie sie wollen, schlussendlich werde\nich siegen.\n\nLangsam finde ich Gefallen an diesem Auftrag.\nNormalerweise kümmere ich mich nur um die Truppen,\nnicht aber um die Infrastruktur.',
        msg17   = 'Welch wunderschöne Bucht. Die Ruine zeigt, dass der\nDieb wohl hier gelandet ist und das Schiff nur\nabgetrieben ist. Ich sollte einen Hafen bauen und\neine Versorgungslinie aufbauen.',
        msg18   = 'Es sieht so aus, als würde ich nicht die erwartete\nUnterstützung erhalten. Der König hat mir lediglich\nein Contubernium zur Verfügung gestellt. Außerdem\nbemängelt er, dass die Aufgabe noch nicht erfüllt ist\nund ich stattdessen wertvolle Zeit mit dem Bau eines\nHafens verschwendet habe. Ich muss mich beeilen, den\nZorn des Herrschers hat noch keiner überlebt.',
        msg19   = 'Diese Banditen sehen sehr reich aus. Der Dieb kam\nwohl hier entlang und bezahlte sie großzügig um\nDurchlass zu erhalten. Ich muss vorsichtig sein,\nviele Schwerter lassen sich für den richtigen Lohn\nanheuern. Möglicherweise gibt es einen anderen Weg\nden ich einschlagen könnte.',
        msg20   = 'So sehr ich die Gefangenen auch gefoltert habe, so\nwenig konnten sie mir über einen Dieb berichten. Er\nscheint nicht hier entlang gekommen zu sein. Soll es\nam Ende stimmen, dass diese Bauern lediglich etwas\nGlück hatten und auf Gold gestoßen sind? Selbst wenn,\nso hätten sie mit einem Kommandanten des Königs\nkooperieren müssen.\n\nImmerhin konnte ich etwas Kohle und ein paar\nGoldmünzen sicherstellen.',
        msg21   = 'Das ist das Lager des Diebes! Endlich ist die\nErfüllung meiner Aufgabe nahe. Ich muss es zerstören\nund den Dieb fangen. Der König verlangt, dass ich ihn\nlebend übergebe.\n\nEs sieht so aus, als hätten sie die Wachtürme\nteilweise wieder aufgebaut. Die Wehranlagen sind\nlange nicht mehr besetzt, seit der Norden sich\nunterworfen hat. In den kargen Bergen kann auch kaum\neine Menschenseele überleben.',
        msg22   = 'Hier wurde eine große Menge an Waffen hergestellt.\nDaher stammen die Markierungen für Eisen die wir auf\nunserem Weg immer wieder entdecken konnten. Scheinbar\nhaben sie nur die oberen, schnell erreichbaren\nSchichten abgetragen. Zum Glück waren wir schnell\ngenug und sie konnten mit den Waffen keine Bauern\naufrüsten.',
        msg23   = 'Wir haben jeden Stein an diesem verdammten Ort\numgedreht und keine Spur gefunden. Der Dieb muss\neinfach in den Norden geflohen sein. Er muss den Ring\nweiter bei sich tragen denn auch von diesem fehlt\njede Spur. Mit unserer Ausrüstung können wir jedoch\nnicht in die Kälte des Nordens folgen. Der\nAschenklafter Berg ist tückisch und berüchtigt für\ndas Verschwinden unachtsamer Wanderer.',
        msg24   = 'Sieht aus wie ein heidnisches Ritual. Ich frage mich\nwas hier wohl geopfert wurde. Mensch, Tier oder gar\nbeides. Sollen die Bauern glauben woran sie wollen,\nich glaube an die Stärke meines Schwertarms.',
        msg25   = 'Ein weiteres geplündertes Lager. Diese Tiere machen\nvor nichts halt. Auch hier sind keine Leichen zu\nfinden - oder sie sind unter den Trümmern begraben.',
        msg26   = 'Was ist hier passiert. Eigentlich sollte hier ein\nkleiner Wachposten stehen. Ist die Einheit des Diebes\nso groß, dass sie eine königliche Garnison überrennen\nkönnen? Auch hier gibt es keine Leichen.',
        msg27   = 'Das Material die Berge hinauf zu schleppen ist\nbeschwerlich und nimmt viel Zeit in Anspruch. ich\nsollte einige Verbesserungen vornehmen und entlang\ndes Weges Lager errichten. So sollte es mir möglich\nsein schneller zu agieren und mir einen taktischen\nVorteil zu verschaffen.',

        hosttitle = 'Wichtig',
        hosthint = 'PBitte überprüfe die Einstellungen der Addons, einige können individuell angepasst werden. Durch eine Anpassung kann sich der Schwierigkeitsgrad ändern was zu einer anderen Spielerfahrung als erwartet führen kann.\n\n\nBitte melde alle Fehler die auftreten!\n'
    }
})

local tasks = {}
-- state, make sure they are in the order you like
-- if a state is 0 or 100, it is expected to be invisible
-- if a state is > 100, it is expected to be a sub task or hint
tasks = {
0,      -- 1    chase
0,      -- 2    salvage ships
100,    -- 3    build two sawmills
100,    -- 4    keep exploring
0,      -- 5    increase army size
100,    -- 6    search for food
100,    -- 7    brew beer
100,    -- 8    find iron
100,    -- 9    build armory iron smelter
100,    -- 10   build harbor
100     -- 11   find coal
}

function BuildTaskText()
    -- buid header for the main goals
    local taskText = _('tasks_main')
    taskText = taskText .. '\n------------------------------------------------------------------------'

    -- build spacer between main goals and sub goals
    local taskSub = '\n\n\n' .. _('tasks_sub')
    taskSub = taskSub .. '\n------------------------------------------------------------------------'

    for i = 1, #tasks do
        -- ignore inactive tasks
        if(tasks[i] ~= 0 and tasks[i] ~= 100) then
            -- build textfield 'task<ID>_<state>'
            local textField = ('task' .. tostring(i) ..'_' ..tostring(tasks[i]))
            -- get text by field
            local text = _(textField)
            -- if text equals textfield it does not exist
            if(text ~= textField) then
                if(tasks[i] > 100) then
                    taskSub = taskSub .. "\n" .. text
                else
                    taskText = taskText .. "\n" .. text
                end
            else
                rttr:Log("Task: '" ..i.. "' tried to load text '" ..textField.. "' which does not exist!")
            end
        end
    end

    taskText = taskText .. taskSub

    taskText = taskText .. '\n\n\n\n\n' .. _('tasks_legend')
    taskText = taskText .. '\n------------------------------------------------------------------------'
    taskText = taskText .. _('tasks_hint') .. '\n\n'

    rttr:SetMissionGoal(0, taskText)
end

-- format mission texts
function MissionText(e, silent)
    local msg = _('msg' .. tostring(e))

    if(msg ~= ('msg' .. tostring(e))) then
        if not silent then
            rttr:MissionStatement(0, _('Diary'), _('title2').. '\n\n' ..msg .. '\n\n\n\n\n\n\n' .. _('logbook'), IM_RIDER, true)
        end
    else
        rttr:Log("Error: no Translation found!" .. msg)
    end

    BuildTaskText()
end

eIdx = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36}


function onSettingsReady()
    rttr:Log("-----------------------\n Mission Script loaded... \n-----------------------\n")
    rttr:SetAddon(ADDON_AI_DEBUG_WINDOW, false)
    rttr:SetAddon(ADDON_ADJUST_MILITARY_STRENGTH, 1)
    rttr:SetAddon(ADDON_DEFENDER_BEHAVIOR, 2)
    rttr:SetAddon(ADDON_CHANGE_GOLD_DEPOSITS, 0)
    rttr:SetAddon(ADDON_METALWORKSBEHAVIORONZERO, 0)
    rttr:SetAddon(ADDON_STATISTICS_VISIBILITY, 1)
    rttr:SetAddon(ADDON_COINS_CAPTURED_BLD, 0)
    rttr:SetAddon(ADDON_CUSTOM_BUILD_SEQUENCE, false)
    rttr:SetAddon(ADDON_DEMOLISH_BLD_WO_RES, false)
    rttr:SetAddon(ADDON_DEMOLITION_PROHIBITION , 1)
    rttr:SetAddon(ADDON_NO_COINS_DEFAULT, false)
    rttr:SetAddon(ADDON_ECONOMY_MODE_GAME_LENGTH , 0)
    rttr:SetAddon(ADDON_BATTLEFIELD_PROMOTION, false)
    rttr:SetAddon(ADDON_CHARBURNER, true)
    rttr:SetAddon(ADDON_EXHAUSTIBLE_WATER , 2)
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_DURABLE_GEOLOGIST_SIGNS, 0)
    rttr:SetAddon(ADDON_INEXHAUSTIBLE_MINES, false)
    rttr:SetAddon(ADDON_LIMIT_CATAPULTS, 3)
    rttr:SetAddon(ADDON_MANUAL_ROAD_ENLARGEMENT, false)
    rttr:SetAddon(ADDON_MILITARY_AID, false)
    rttr:SetAddon(ADDON_MILITARY_CONTROL, false)
    rttr:SetAddon(ADDON_MILITARY_HITPOINTS, false)
    rttr:SetAddon(ADDON_MORE_ANIMALS, 0)
    rttr:SetAddon(ADDON_NUM_SCOUTS_EXPLORATION, 2)
    rttr:SetAddon(ADDON_PEACEFULMODE, false)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
    rttr:SetAddon(ADDON_REFUND_MATERIALS, 0)
    rttr:SetAddon(ADDON_REFUND_ON_EMERGENCY, false)
    rttr:SetAddon(ADDON_SEA_ATTACK, 2)
    rttr:SetAddon(ADDON_BURN_DURATION, 0)
    rttr:SetAddon(ADDON_MAX_RANK, 0)
    rttr:SetAddon(ADDON_MAX_WATERWAY_LENGTH, 1)
    rttr:SetAddon(ADDON_SHIP_SPEED, 3)
    rttr:SetAddon(ADDON_TOOL_ORDERING, false)
    rttr:SetAddon(ADDON_TRADE, false)

    rttr:SetGameSettings({
        ["teamView"] = true,
        ["lockedTeams"] = false,
        ["objective"] = GO_TOTALDOMINATION,
        ["fow"] = EXP_CLASSIC
    })

    rttr:GetPlayer(1):SetAI(3)
    rttr:GetPlayer(1):SetName(_('nameAI'))
    rttr:GetPlayer(2):SetAI(3)
    rttr:GetPlayer(2):SetName(_('nameAI'))
    rttr:GetPlayer(3):SetAI(3)
    rttr:GetPlayer(3):SetName(_('nameAI'))
    rttr:GetPlayer(4):SetAI(3)
    rttr:GetPlayer(4):SetName(_('nameAI'))

    rttr:GetPlayer(2):SetTeam(TM_TEAM1)
    rttr:GetPlayer(3):SetTeam(TM_TEAM1)
    rttr:GetPlayer(4):SetTeam(TM_TEAM1)

    rttr:GetPlayer(2):SetColor(5)
    rttr:GetPlayer(4):SetColor(2)

    rttr:MsgBox(_('hosttitle'), _('hosthint'), true)
end

function getAllowedChanges()
    return  {
        ["general"]     = false,
        ["addonsAll"]   = false,
        ["addonsSome"]  = true,
        ["ownNation"]   = false,
        ["ownColor"]    = true,
        ["ownTeam"]     = false,
        ["aiNation"]    = false,
        ["aiColor"]     = false,
        ["aiTeam"]      = false,
        ["swapping"]    = false
    }
end

function getAllowedAddons()
    return {
        ADDON_MANUAL_ROAD_ENLARGEMENT,
        ADDON_REFUND_ON_EMERGENCY,
        ADDON_CATAPULT_GRAPHICS,
        ADDON_METALWORKSBEHAVIORONZERO,
        ADDON_CUSTOM_BUILD_SEQUENCE,
        ADDON_NO_COINS_DEFAULT,
        ADDON_TOOL_ORDERING,
        ADDON_MILITARY_AID,
        ADDON_MILITARY_CONTROL,
        ADDON_MILITARY_HITPOINTS,
        ADDON_COINS_CAPTURED_BLD,
        ADDON_DEMOLISH_BLD_WO_RES,
        ADDON_DURABLE_GEOLOGIST_SIGNS
    }
end

function onStart(isFirstStart)
    BuildTaskText()


    addPlayerRes(0, not isFirstStart)
    rttr:GetPlayer(0):ModifyHQ(1)
    rttr:GetPlayer(0):DisableAllBuildings()

    rttr:GetPlayer(0):EnableBuilding(BLD_SAWMILL, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_HARBORBUILDING, false)

    addPlayerRes(1, not isFirstStart)
    rttr:GetPlayer(1):SetRestrictedArea(
    nil, nil,
    114,164,
    110,156,
    111,154,
    117,151,
    120,159,
    117,164,
    nil, nil
    )
    rttr:GetPlayer(1):ModifyHQ(1)
    rttr:GetPlayer(1):DisableAllBuildings()

    rttr:GetPlayer(1):EnableBuilding(BLD_HARBORBUILDING, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_FISHERY, false)

    rttr:GetPlayer(1):AIConstructionOrder(113,159,BLD_HARBORBUILDING)

    rttr:GetPlayer(1):AIConstructionOrder(112,156,BLD_FISHERY)
    rttr:GetPlayer(1):AIConstructionOrder(115,161,BLD_FISHERY)

    addPlayerRes(2, not isFirstStart)
    rttr:GetPlayer(2):ModifyHQ(1)
    rttr:GetPlayer(2):DisableAllBuildings()

    rttr:GetPlayer(2):EnableBuilding(BLD_GUARDHOUSE, false)
    rttr:GetPlayer(2):EnableBuilding(BLD_CATAPULT, false)

    rttr:GetPlayer(2):AIConstructionOrder(90,139,BLD_CATAPULT)
    rttr:GetPlayer(2):AIConstructionOrder(91,137,BLD_GUARDHOUSE)

    -- AI 3 --
    addPlayerRes(3, not isFirstStart)
    rttr:GetPlayer(3):DisableAllBuildings()
    rttr:GetPlayer(3):EnableBuilding(BLD_MINT, false)
    rttr:GetPlayer(3):EnableBuilding(BLD_GUARDHOUSE, false)
    rttr:GetPlayer(3):EnableBuilding(BLD_STOREHOUSE, false)
    rttr:GetPlayer(3):EnableBuilding(BLD_LOOKOUTTOWER, false)

    rttr:GetPlayer(3):AIConstructionOrder(67,114,BLD_GUARDHOUSE)
    rttr:GetPlayer(3):AIConstructionOrder(67,109,BLD_GUARDHOUSE)
    rttr:GetPlayer(3):AIConstructionOrder(64,107,BLD_STOREHOUSE)
    rttr:GetPlayer(3):AIConstructionOrder(68,116,BLD_MINT)
    rttr:GetPlayer(3):AIConstructionOrder(70,117,BLD_LOOKOUTTOWER)

    -- AI 4 --
    rttr:GetPlayer(4):ModifyHQ(1)
    addPlayerRes(4, not isFirstStart)
    rttr:GetPlayer(4):DisableAllBuildings()
    rttr:GetPlayer(4):EnableBuilding(BLD_WATCHTOWER, false)
    rttr:GetPlayer(4):EnableBuilding(BLD_GUARDHOUSE, false)
    rttr:GetPlayer(4):EnableBuilding(BLD_STOREHOUSE, false)
    rttr:GetPlayer(4):EnableBuilding(BLD_IRONSMELTER, false)
    rttr:GetPlayer(4):EnableBuilding(BLD_ARMORY, false)
    rttr:GetPlayer(4):EnableBuilding(BLD_LOOKOUTTOWER, false)

    rttr:GetPlayer(4):AIConstructionOrder(83,70,BLD_WATCHTOWER)
    rttr:GetPlayer(4):AIConstructionOrder(78,71,BLD_GUARDHOUSE)
    rttr:GetPlayer(4):AIConstructionOrder(77,62,BLD_WATCHTOWER)
    
    rttr:GetPlayer(4):AIConstructionOrder(78,59,BLD_STOREHOUSE)
    
    rttr:GetPlayer(4):AIConstructionOrder(79,68,BLD_IRONSMELTER)
    
    rttr:GetPlayer(4):AIConstructionOrder(84,64,BLD_ARMORY)
    rttr:GetPlayer(4):AIConstructionOrder(79,62,BLD_ARMORY)
    
    rttr:GetPlayer(4):AIConstructionOrder(78,78,BLD_LOOKOUTTOWER)

    -- World Objects --
    if(isFirstStart) then
        -- Near AI 4 --
        rttr:GetWorld():AddStaticObject(81, 75, 4, 2, 2)
        rttr:GetWorld():AddStaticObject(77, 81, 4, 2, 2)

        -- Burned camp 1 (near AI 4) --
        rttr:GetWorld():AddEnvObject(87, 87, 2524, 0xFFFF)
        rttr:GetWorld():AddEnvObject(87, 90, 2524, 0xFFFF)
        rttr:GetWorld():AddEnvObject(86, 90, 547, 0xFFFF)
        rttr:GetWorld():AddEnvObject(87, 92, 547, 0xFFFF)
        rttr:GetWorld():AddEnvObject(86, 91, 548, 0xFFFF)
        rttr:GetWorld():AddEnvObject(88, 88, 548, 0xFFFF)
        rttr:GetWorld():AddEnvObject(91, 84, 695, 0xFFFF)

        -- hidden destroyed harbor --
        rttr:GetWorld():AddEnvObject(46, 182, 2525, 0xFFFF)

        -- Burned camp 2 (near AI 3) --
        rttr:GetWorld():AddEnvObject(65, 136, 2524, 0xFFFF)

        -- iron 01 (left of player 2)
        rttr:GetWorld():AddEnvObject(99, 143, 682, 0xFFFF)
        rttr:GetWorld():AddEnvObject(99, 144, 682, 0xFFFF)
        rttr:GetWorld():AddEnvObject(98, 145, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(100, 142, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(99, 145, 680, 0xFFFF)

        -- nothing
        rttr:GetWorld():AddEnvObject(89, 60, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(81, 168, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(69, 175, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(62, 183, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(45, 165, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(55, 169, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(49, 175, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(87, 163, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(108, 141, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(77, 150, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(68, 155, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(62, 137, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(68, 133, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(63, 122, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(65, 103, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(84, 120, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(85, 136, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(90, 146, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(100, 128, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(104, 115, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(108, 124, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(111, 107, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(102, 98, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(85, 107, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(77, 106, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(75, 91, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(86, 84, 695, 0xFFFF)

        -- iron 02 (left of player 1)
        rttr:GetWorld():AddEnvObject(56, 180, 682, 0xFFFF)
        rttr:GetWorld():AddEnvObject(54, 179, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(54, 181, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(56, 179, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(56, 181, 680, 0xFFFF)

        -- burned buildings path (left)
        rttr:GetWorld():AddEnvObject(81, 178, 2524, 0xFFFF)
        rttr:GetWorld():AddEnvObject(74, 179, 2524, 0xFFFF)

        -- burned buildings (path right)
        rttr:GetWorld():AddEnvObject(88, 169, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(90, 168, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(93, 161, 531, 0xFFFF)

        -- burned buildings (path top)
        rttr:GetWorld():AddEnvObject(86, 144, 2524, 0xFFFF)
        rttr:GetWorld():AddEnvObject(82, 137, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(79, 131, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(79, 124, 2524, 0xFFFF)

        -- pagan location
        rttr:GetWorld():AddEnvObject(73, 155, 2524, 0xFFFF)
        rttr:GetWorld():AddStaticObject(73, 157, 8, 2, 1)
        rttr:GetWorld():AddEnvObject(72, 155, 547, 0xFFFF)
        rttr:GetWorld():AddEnvObject(73, 154, 548, 0xFFFF)
        rttr:GetWorld():AddEnvObject(74, 154, 547, 0xFFFF)
        rttr:GetWorld():AddEnvObject(74, 155, 548, 0xFFFF)
        rttr:GetWorld():AddEnvObject(73, 153, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(74, 153, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(75, 155, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(75, 154, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(76, 154, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(75, 153, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(72, 154, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(71, 155, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(72, 156, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(71, 156, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(71, 157, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(72, 158, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(72, 159, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(73, 159, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(74, 159, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(75, 156, 531, 0xFFFF)

        -- iron 03 (left of player 3)
        rttr:GetWorld():AddEnvObject(70, 146, 682, 0xFFFF)
        rttr:GetWorld():AddEnvObject(70, 147, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(70, 145, 680, 0xFFFF)

        -- iron 04 (under player 4)
        rttr:GetWorld():AddEnvObject(62, 121, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(62, 123, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(63, 124, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(63, 126, 680, 0xFFFF)

        -- iron 05 (over player 3)
        rttr:GetWorld():AddEnvObject(100, 118, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(100, 120, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(99, 121, 680, 0xFFFF)

        -- iron 06 (right of player 3)
        rttr:GetWorld():AddEnvObject(112, 119, 682, 0xFFFF)
        rttr:GetWorld():AddEnvObject(113, 118, 680, 0xFFFF)

        -- iron 07 (over player 3 II)
        rttr:GetWorld():AddEnvObject(98, 98, 682, 0xFFFF)
        rttr:GetWorld():AddEnvObject(97, 99, 682, 0xFFFF)
        rttr:GetWorld():AddEnvObject(98, 100, 682, 0xFFFF)
        rttr:GetWorld():AddEnvObject(99, 100, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(97, 100, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(96, 99, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(97, 98, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(98, 97, 680, 0xFFFF)

        -- iron 08 (under player 5)
        rttr:GetWorld():AddEnvObject(91, 84, 2524, 0xFFFF)
        rttr:GetWorld():AddEnvObject(90, 86, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(91, 85, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(91, 82, 680, 0xFFFF)

        -- destroyed ships
        rttr:GetWorld():AddStaticObject(88, 179, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(89, 177, 0, 0, 1)
    end


-- 79,167 -> unlock woodcutter/stonemason
    -- 531 = cut tree
    -- miss0, 0 = tent
    -- miss0, 0 = destroyed ship
    -- miss2, 8 = puppet
    -- 511 = waterstone
    -- 559 = snowman
    -- 680 = shield iron low
    -- 681 = shield iron med
    -- 682 = shield iron
    -- 695 = shield nothing
    -- 2253 = axe
    -- 2255 = pickaxe
    -- 2257 = crucible
    -- 2524 = rubble small
    -- 2525 = rubble large
    -- 535 = grainfield
    -- 547 = corpse 1
    -- 548 = corpse 2

    eState = {}
    for _, i in ipairs(eIdx) do
        eState[i] = 1
    end

    if not isFirstStart then                    -- initialize history of all called events, event counter at ["n"]
        for i = 1, eHist["n"] do
            MissionEvent(eHist[i], true)        -- call events without mission text to activate all achievements
        end
    else
        eHist = {["n"] = 0}
    end
end

-- save callback
function onSave(saveGame)
    saveGame:PushInt(eHist["n"])
    for i = 1, eHist["n"] do
        saveGame:PushInt(eHist[i])
    end
    return true
end

-- load callback
function onLoad(saveGame)
    eHist = {["n"] = saveGame:PopInt()}
    for i = 1, eHist["n"] do
        eHist[i] = saveGame:PopInt()
    end
    return true
end

function onGameFrame(gf)
    if((gf%20)~=0) then
        return
    end

    if (gf == 20) then
        MissionEvent(1)
    end

    if (eState[2] == 1 and rttr:GetPlayer(0):GetNumBuildings(BLD_SAWMILL) >= 2) then
        MissionEvent(2)
    end
    
    if (eState[10] == 1 and (rttr:GetPlayer(1):GetNumBuildings(BLD_HARBORBUILDING) + rttr:GetPlayer(1):GetNumBuildings(BLD_HEADQUARTERS) <= 0)) then
        MissionEvent(10)
    end
    
    if (eState[12] == 1 and (rttr:GetPlayer(2):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(2):GetNumBuildings(BLD_HEADQUARTERS) <= 0)) then
        MissionEvent(12)
    end
    
    if (eState[13] == 1 and rttr:GetPlayer(0):GetNumWares(GD_IRONORE) > 0) then
        MissionEvent(13)
    end
    
    if (eState[14] == 1 and rttr:GetPlayer(0):GetNumBuildings(BLD_WELL) > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_BREWERY) > 0) then
        MissionEvent(14)
    end
    
    if (eState[15] == 1 and rttr:GetPlayer(0):GetNumBuildings(BLD_IRONSMELTER) > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_ARMORY) > 0) then
        MissionEvent(15)
    end
    
    if (eState[16] == 1 and 
        rttr:GetPlayer(0):GetNumWares(GD_SWORD) > 0 and
        rttr:GetPlayer(0):GetNumWares(GD_SHIELD) > 0 and
        rttr:GetPlayer(0):GetNumWares(GD_BEER) > 0) then
        MissionEvent(16)
    end
    
    if(eState[18] == 1 and rttr:GetPlayer(0):GetNumBuildings(BLD_HARBORBUILDING) > 1) then
        MissionEvent(18)
    end
    
    if(eState[20] == 1  and (rttr:GetPlayer(3):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(3):GetNumBuildings(BLD_HEADQUARTERS) <= 0)) then
        MissionEvent(20)
    end
    
    if (eState[23] == 1 and 
        rttr:GetPlayer(4):GetNumBuildings(BLD_GUARDHOUSE) <= 0 and
        rttr:GetPlayer(4):GetNumBuildings(BLD_WATCHTOWER) <= 0 and
        rttr:GetPlayer(4):GetNumBuildings(BLD_HEADQUARTERS) <= 0) then
        MissionEvent(23)
    end
end

function onOccupied(p, x, y)
    if(p == 3) then
        if(x==64 and (y==107 or y==106)) then
            rttr:GetPlayer(3):AIConstructionOrder(64,107,BLD_STOREHOUSE)
            rttr:Log("Set order again")
        end
    elseif(p==4) then
        if(x==78 and y==78) then
            rttr:GetPlayer(4):AIConstructionOrder(78,78,BLD_LOOKOUTTOWER)
            rttr:Log("Set order again 2")
        end
    end
    
    if(p == 0) then
        if(x==73 and y==186) then
            MissionEvent(3)
        elseif(x==80 and y==167) then
            MissionEvent(4)
        elseif(x==93 and y==163) then
            MissionEvent(5)
        elseif(x==92 and y==155) then
            MissionEvent(6)
        elseif(x==46 and y==182) then
            MissionEvent(17)
        elseif(x==73 and y==155) then
            MissionEvent(24)
        elseif(x==65 and y==135) then
            MissionEvent(25)
        elseif(x==87 and y==90) then
            MissionEvent(26)
        elseif((x==84 and y == 120) or (x==88 and y==108)) then
            MissionEvent(27)
        end
        
        -- those can happen with events above
        -- and some at the same time
        if(x==46 and y==182) then MissionEvent(28) end
        if(x==93 and y==165) then MissionEvent(29) end
        if(x==86 and y==144) then MissionEvent(30) end
        if(x==79 and y==124) then MissionEvent(31) end
        if(x==73 and y==155) then MissionEvent(32) end
        if(x==65 and y==136) then MissionEvent(33) end
        if(x==87 and y==90) then MissionEvent(34) end
        if(x==87 and y==87) then MissionEvent(35) end
        if(x==91 and y==84) then MissionEvent(36) end
    end
end

function onExplored(p, x, y, owner)
    if(p ~= 0 or owner == nil) then
        return
    end

    if (owner == 1) then
        MissionEvent(7)
    end
    
    if (owner == 3) then
        MissionEvent(19)
    end
    
    if (owner == 4) then
        MissionEvent(21)
    end
    
    if(x==90 and y==139) then
        MissionEvent(11)
    end
    
    if((x==84 and y==64) or (x==79 and y==62))then
        MissionEvent(22)
    end
end

function onSuggestPact(PactType, suggestedByPlayerIdx, targetPlayerIdx, duration)
    if(targetPlayerIdx ~= 1) then
        rttr:Log("Pact: Wrong target")
        return false;
    end

    if(eState[7] == 0) then
        if (PactType ~= TREATY_OF_ALLIANCE or duration ~= DURATION_INFINITE) then
            MissionEvent(8)
            rttr:Log("Pact: Wrong type")
            return false;
        else
            MissionEvent(9)
            rttr:Log("Pact: accept")
            return true;
        end
    end
end

function onCancelPactRequest(pactType, fromPlayerIdx, toPlayerIdx)
    return false;
end

function MissionEvent(e, onLoad)
    -- event e is inactive
    if(eState[e] <= 0) then
        rttr:Log("State less or equal 0")
        return
    end

    if(e == 1) then
        -- enable maintask
        tasks[1] = 1
        tasks[2] = 1
        tasks[3] = 101
    elseif(e == 2) then
        -- update task 2
        tasks[2] = 2    -- salvage ships done
        tasks[3] = 100  -- build 2 sawmills
        tasks[4] = 101  -- keep expanding

        -- add barracks
        rttr:GetPlayer(0):EnableBuilding(BLD_BARRACKS, not onLoad)

        -- add wood
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_WOOD] = 30})
        end

        -- remove ships
        rttr:GetWorld():AddStaticObject(88, 179, 551, 0xFFFF, 1)
        rttr:GetWorld():AddStaticObject(89, 177, 551, 0xFFFF, 1)
    elseif(e == 3) then
        if(not onLoad) then
            rttr:PostMessageWithLocation(0, _('lookhere'), 73, 186)
        end

        rttr:GetWorld():AddEnvObject(72, 183, 2524, 0xFFFF)
        rttr:GetWorld():AddEnvObject(75, 184, 2524, 0xFFFF)
        rttr:GetWorld():AddStaticObject(73, 186, 0, 2, 1)
        rttr:GetWorld():AddEnvObject(74, 186, 2255, 0xFFFF)
        rttr:GetWorld():AddEnvObject(73, 187, 2257, 0xFFFF)
        rttr:GetWorld():AddEnvObject(75, 185, 2253, 0xFFFF)
    elseif(e == 4) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 60})
            rttr:GetPlayer(0):AddPeople({
                [JOB_IRONFOUNDER] = 2,
                [JOB_ARMORER    ] = 2,
                [JOB_WOODCUTTER ] = 3,
                [JOB_STONEMASON ] = 3,
                [JOB_MINER      ] = 2
            })
        end
        tasks[4] = 100

        -- remove tools
        rttr:GetWorld():AddEnvObject(74, 186, 551, 0xFFFF)
        rttr:GetWorld():AddEnvObject(73, 187, 551, 0xFFFF)
        rttr:GetWorld():AddEnvObject(75, 185, 551, 0xFFFF)

        -- add quarry and woodcutter
        rttr:GetPlayer(0):EnableBuilding(BLD_WOODCUTTER, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_QUARRY, not onLoad)
    elseif(e == 5) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_GRAIN] = 130})
        end

        rttr:GetPlayer(0):EnableBuilding(BLD_IRONSMELTER, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_IRONMINE, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_ARMORY, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_WELL, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_BREWERY, not onLoad)

        -- Burned farm (right of the player) --
        rttr:GetWorld():AddStaticObject(93, 165, 2525, 0xFFFF, 1)
        rttr:GetWorld():AddStaticObject(93, 167, 535, 0xFFFF, 1)
        rttr:GetWorld():AddStaticObject(92, 166, 535, 0xFFFF, 1)
        rttr:GetWorld():AddStaticObject(92, 163, 535, 0xFFFF, 1)
        rttr:GetWorld():AddStaticObject(94, 163, 535, 0xFFFF, 1)

        if(not onLoad) then
            rttr:PostMessageWithLocation(0, _('lookhere'), 93, 163)
        end

        tasks[5] = 1
        tasks[6] = 101
        tasks[7] = 101
        tasks[8] = 101
        tasks[9] = 101
        tasks[11] = 101
    elseif(e == 6) then
        -- nothing happening here
    elseif(e == 7) then
        tasks[6] = 102
    elseif(e == 8) then
        -- just a message
    elseif(e == 9) then
        tasks[6] = 103

        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20, [GD_FISH] = 200})
        end
    elseif(e == 10) then
        task[6] = 104
        
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 40, [GD_FISH] = 100})
        end
    elseif(e == 11) then
        if(not onLoad) then
            rttr:PostMessageWithLocation(0, _('lookhere'), 90, 139)
        end
    elseif(e == 12) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
        end
    elseif(e == 13) then
        tasks[8] = 102
    elseif(e == 14) then
        tasks[7] = 102
    elseif(e == 15) then
        tasks[9] = 102
    elseif(e == 16) then
        tasks[7] = 100
        tasks[8] = 100
        tasks[9] = 100
        tasks[5] = 2
    elseif(e == 17) then
        tasks[10] = 101
    elseif(e == 18) then
        tasks[10] = 102
        if(not onLoad) then
            rttr:GetPlayer(0):AddPeople({
                [JOB_SERGEANT] = 8,
                [JOB_PACKDONKEY] = 20
            })
        end
    elseif(e == 19) then
        -- nothing here
    elseif(e == 20) then
        rttr:GetPlayer(0):AddWares({[GD_COAL] = 20, [GD_COINS] = 3})
    elseif(e == 21) then
        tasks[1] = 2
    elseif(e == 22) then
        -- nothing here
    elseif(e == 23) then
        tasks[1] = 3
    elseif(e == 24) then
        -- nothing here
    elseif(e == 25) then
        -- nothing here
    elseif(e == 26) then
        -- nothing here
    elseif(e == 27) then
        rttr:GetPlayer(0):EnableBuilding(BLD_STOREHOUSE, not onLoad)
    elseif(e == 28) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 46, 182)
        end
    elseif(e == 29) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 93, 165)
        end
    elseif(e == 30) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 86, 144)
        end
    elseif(e == 31) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 79, 124)
        end
    elseif(e == 32) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 73, 155)
        end
    elseif(e == 33) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 65, 136)
        end
    elseif(e == 34) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 87, 90)
        end
    elseif(e == 35) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 87, 87)
        end
    elseif(e == 36) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 91, 84)
        end
    end

    -- update event state
    eState[e] = eState[e] - 1

    -- no history update or mission texts while loading
    if not onLoad then
        rttr:Log(">> Event: " .. e .. ",\teState[" .. e .. "] = " .. eState[e])
        eHist["n"] = eHist["n"] + 1
        eHist[eHist["n"]] = e
    end

    MissionText(e, onLoad)
end

function addPlayerRes(p, onLoad)
    if onLoad then return end

    rttr:GetPlayer(p):ClearResources()

    if (p == 0) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 0,
            [GD_BOARDS      ] = 20,
            [GD_STONES      ] = 16,
            [GD_HAM         ] = 0,
            [GD_GRAIN       ] = 0,
            [GD_FLOUR       ] = 0,
            [GD_FISH        ] = 0,
            [GD_MEAT        ] = 0,
            [GD_BREAD       ] = 0,
            [GD_WATER       ] = 0,
            [GD_BEER        ] = 0,
            [GD_COAL        ] = 0,
            [GD_IRONORE     ] = 0,
            [GD_GOLD        ] = 0,
            [GD_IRON        ] = 0,
            [GD_COINS       ] = 0,
            [GD_TONGS       ] = 0,
            [GD_AXE         ] = 0,
            [GD_SAW         ] = 0,
            [GD_PICKAXE     ] = 0,
            [GD_HAMMER      ] = 0,
            [GD_SHOVEL      ] = 0,
            [GD_CRUCIBLE    ] = 0,
            [GD_RODANDLINE  ] = 0,
            [GD_SCYTHE      ] = 0,
            [GD_CLEAVER     ] = 0,
            [GD_ROLLINGPIN  ] = 0,
            [GD_BOW         ] = 0,
            [GD_SWORD       ] = 0,
            [GD_SHIELD      ] = 0,
            [GD_BOAT        ] = 2
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 10,
            [JOB_WOODCUTTER         ] = 0,
            [JOB_FISHER             ] = 0,
            [JOB_FORESTER           ] = 0,
            [JOB_CARPENTER          ] = 2,
            [JOB_STONEMASON         ] = 0,
            [JOB_HUNTER             ] = 0,
            [JOB_FARMER             ] = 0,
            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_MINER              ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,
            [JOB_IRONFOUNDER        ] = 0,
            [JOB_MINTER             ] = 0,
            [JOB_METALWORKER        ] = 0,
            [JOB_ARMORER            ] = 0,
            [JOB_BUILDER            ] = 6,
            [JOB_PLANER             ] = 2,
            [JOB_GEOLOGIST          ] = 0,
            [JOB_PRIVATE            ] = 16,
            [JOB_PRIVATEFIRSTCLASS  ] = 0,
            [JOB_SERGEANT           ] = 1,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0,
            [JOB_SCOUT              ] = 0,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_PACKDONKEY         ] = 0,
            [JOB_BOATCARRIER        ] = 0,
            [JOB_CHARBURNER         ] = 0
        })
    elseif (p == 1) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 0,
            [GD_BOARDS      ] = 18,
            [GD_STONES      ] = 16,
            [GD_HAM         ] = 0,
            [GD_GRAIN       ] = 0,
            [GD_FLOUR       ] = 0,
            [GD_FISH        ] = 0,
            [GD_MEAT        ] = 0,
            [GD_BREAD       ] = 0,
            [GD_WATER       ] = 0,
            [GD_BEER        ] = 0,
            [GD_COAL        ] = 0,
            [GD_IRONORE     ] = 0,
            [GD_GOLD        ] = 0,
            [GD_IRON        ] = 0,
            [GD_COINS       ] = 0,
            [GD_TONGS       ] = 0,
            [GD_AXE         ] = 0,
            [GD_SAW         ] = 0,
            [GD_PICKAXE     ] = 0,
            [GD_HAMMER      ] = 0,
            [GD_SHOVEL      ] = 0,
            [GD_CRUCIBLE    ] = 0,
            [GD_RODANDLINE  ] = 0,
            [GD_SCYTHE      ] = 0,
            [GD_CLEAVER     ] = 0,
            [GD_ROLLINGPIN  ] = 0,
            [GD_BOW         ] = 0,
            [GD_SWORD       ] = 0,
            [GD_SHIELD      ] = 0,
            [GD_BOAT        ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 10,
            [JOB_WOODCUTTER         ] = 0,
            [JOB_FISHER             ] = 0,
            [JOB_FORESTER           ] = 0,
            [JOB_CARPENTER          ] = 0,
            [JOB_STONEMASON         ] = 0,
            [JOB_HUNTER             ] = 0,
            [JOB_FARMER             ] = 0,
            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_MINER              ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,
            [JOB_IRONFOUNDER        ] = 0,
            [JOB_MINTER             ] = 0,
            [JOB_METALWORKER        ] = 0,
            [JOB_ARMORER            ] = 0,
            [JOB_BUILDER            ] = 1,
            [JOB_PLANER             ] = 1,
            [JOB_GEOLOGIST          ] = 0,
            [JOB_PRIVATE            ] = 2,
            [JOB_PRIVATEFIRSTCLASS  ] = 0,
            [JOB_SERGEANT           ] = 0,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0,
            [JOB_SCOUT              ] = 0,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_PACKDONKEY         ] = 0,
            [JOB_BOATCARRIER        ] = 0,
            [JOB_CHARBURNER         ] = 0
        })
    elseif (p == 2) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 0,
            [GD_BOARDS      ] = 13,
            [GD_STONES      ] = 14,
            [GD_HAM         ] = 0,
            [GD_GRAIN       ] = 0,
            [GD_FLOUR       ] = 0,
            [GD_FISH        ] = 0,
            [GD_MEAT        ] = 0,
            [GD_BREAD       ] = 0,
            [GD_WATER       ] = 0,
            [GD_BEER        ] = 0,
            [GD_COAL        ] = 0,
            [GD_IRONORE     ] = 0,
            [GD_GOLD        ] = 0,
            [GD_IRON        ] = 0,
            [GD_COINS       ] = 0,
            [GD_TONGS       ] = 0,
            [GD_AXE         ] = 0,
            [GD_SAW         ] = 0,
            [GD_PICKAXE     ] = 0,
            [GD_HAMMER      ] = 0,
            [GD_SHOVEL      ] = 0,
            [GD_CRUCIBLE    ] = 0,
            [GD_RODANDLINE  ] = 0,
            [GD_SCYTHE      ] = 0,
            [GD_CLEAVER     ] = 0,
            [GD_ROLLINGPIN  ] = 0,
            [GD_BOW         ] = 0,
            [GD_SWORD       ] = 0,
            [GD_SHIELD      ] = 0,
            [GD_BOAT        ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 10,
            [JOB_WOODCUTTER         ] = 0,
            [JOB_FISHER             ] = 0,
            [JOB_FORESTER           ] = 0,
            [JOB_CARPENTER          ] = 0,
            [JOB_STONEMASON         ] = 0,
            [JOB_HUNTER             ] = 0,
            [JOB_FARMER             ] = 0,
            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_MINER              ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,
            [JOB_IRONFOUNDER        ] = 0,
            [JOB_MINTER             ] = 0,
            [JOB_METALWORKER        ] = 0,
            [JOB_ARMORER            ] = 0,
            [JOB_BUILDER            ] = 1,
            [JOB_PLANER             ] = 1,
            [JOB_GEOLOGIST          ] = 0,
            [JOB_PRIVATE            ] = 4,
            [JOB_PRIVATEFIRSTCLASS  ] = 5,
            [JOB_SERGEANT           ] = 0,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0,
            [JOB_SCOUT              ] = 0,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_PACKDONKEY         ] = 0,
            [JOB_BOATCARRIER        ] = 0,
            [JOB_CHARBURNER         ] = 0
        })
    elseif (p == 3) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 0,
            [GD_BOARDS      ] = 24,
            [GD_STONES      ] = 21,
            [GD_HAM         ] = 0,
            [GD_GRAIN       ] = 0,
            [GD_FLOUR       ] = 0,
            [GD_FISH        ] = 0,
            [GD_MEAT        ] = 0,
            [GD_BREAD       ] = 0,
            [GD_WATER       ] = 0,
            [GD_BEER        ] = 0,
            [GD_COAL        ] = 0,
            [GD_IRONORE     ] = 0,
            [GD_GOLD        ] = 0,
            [GD_IRON        ] = 0,
            [GD_COINS       ] = 0,
            [GD_TONGS       ] = 0,
            [GD_AXE         ] = 0,
            [GD_SAW         ] = 0,
            [GD_PICKAXE     ] = 0,
            [GD_HAMMER      ] = 0,
            [GD_SHOVEL      ] = 0,
            [GD_CRUCIBLE    ] = 0,
            [GD_RODANDLINE  ] = 0,
            [GD_SCYTHE      ] = 0,
            [GD_CLEAVER     ] = 0,
            [GD_ROLLINGPIN  ] = 0,
            [GD_BOW         ] = 0,
            [GD_SWORD       ] = 0,
            [GD_SHIELD      ] = 0,
            [GD_BOAT        ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 10,
            [JOB_WOODCUTTER         ] = 0,
            [JOB_FISHER             ] = 0,
            [JOB_FORESTER           ] = 0,
            [JOB_CARPENTER          ] = 0,
            [JOB_STONEMASON         ] = 0,
            [JOB_HUNTER             ] = 0,
            [JOB_FARMER             ] = 0,
            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_MINER              ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,
            [JOB_IRONFOUNDER        ] = 0,
            [JOB_MINTER             ] = 1,
            [JOB_METALWORKER        ] = 0,
            [JOB_ARMORER            ] = 0,
            [JOB_BUILDER            ] = 1,
            [JOB_PLANER             ] = 1,
            [JOB_GEOLOGIST          ] = 0,
            [JOB_PRIVATE            ] = 4,
            [JOB_PRIVATEFIRSTCLASS  ] = 8,
            [JOB_SERGEANT           ] = 1,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0,
            [JOB_SCOUT              ] = 1,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_PACKDONKEY         ] = 0,
            [JOB_BOATCARRIER        ] = 0,
            [JOB_CHARBURNER         ] = 0
        })
    elseif (p == 4) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 0,
            [GD_BOARDS      ] = 32,
            [GD_STONES      ] = 33,
            [GD_HAM         ] = 0,
            [GD_GRAIN       ] = 0,
            [GD_FLOUR       ] = 0,
            [GD_FISH        ] = 0,
            [GD_MEAT        ] = 0,
            [GD_BREAD       ] = 0,
            [GD_WATER       ] = 0,
            [GD_BEER        ] = 0,
            [GD_COAL        ] = 3000,
            [GD_IRONORE     ] = 1000,
            [GD_GOLD        ] = 0,
            [GD_IRON        ] = 2000,
            [GD_COINS       ] = 0,
            [GD_TONGS       ] = 0,
            [GD_AXE         ] = 0,
            [GD_SAW         ] = 0,
            [GD_PICKAXE     ] = 0,
            [GD_HAMMER      ] = 0,
            [GD_SHOVEL      ] = 0,
            [GD_CRUCIBLE    ] = 0,
            [GD_RODANDLINE  ] = 0,
            [GD_SCYTHE      ] = 0,
            [GD_CLEAVER     ] = 0,
            [GD_ROLLINGPIN  ] = 0,
            [GD_BOW         ] = 0,
            [GD_SWORD       ] = 0,
            [GD_SHIELD      ] = 0,
            [GD_BOAT        ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 10,
            [JOB_WOODCUTTER         ] = 0,
            [JOB_FISHER             ] = 0,
            [JOB_FORESTER           ] = 0,
            [JOB_CARPENTER          ] = 0,
            [JOB_STONEMASON         ] = 0,
            [JOB_HUNTER             ] = 0,
            [JOB_FARMER             ] = 0,
            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_MINER              ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,
            [JOB_IRONFOUNDER        ] = 1,
            [JOB_MINTER             ] = 0,
            [JOB_METALWORKER        ] = 0,
            [JOB_ARMORER            ] = 2,
            [JOB_BUILDER            ] = 1,
            [JOB_PLANER             ] = 1,
            [JOB_GEOLOGIST          ] = 0,
            [JOB_PRIVATE            ] = 24,
            [JOB_PRIVATEFIRSTCLASS  ] = 16,
            [JOB_SERGEANT           ] = 1,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0,
            [JOB_SCOUT              ] = 1,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_PACKDONKEY         ] = 0,
            [JOB_BOATCARRIER        ] = 0,
            [JOB_CHARBURNER         ] = 0
        })
    end
end
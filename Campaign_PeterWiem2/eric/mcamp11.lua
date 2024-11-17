function getRequiredLuaVersion()
    return 1
end

local requiredFeature = 4
function checkVersion()
    local featureLevel = rttr:GetFeatureLevel()
    if(featureLevel < requiredFeature) then
        rttr:MsgBox("LUA-Version Error", "Your Return to the Roots version is outdated. The required LUA-Feature level is " ..requiredFeature.. ", your version is "..featureLevel..". The script can possibly crash or run unexpectedly!\n\nPlease update the game!", true)
    end
end

-- Message-Window (mission statement and hints): 52 chars wide
eIdx = {1, 2, 3, 4, 5, 6, 7, 8, 9, 99}

local debugTexts = false;

rttr:RegisterTranslations(
{
    de =
    {
        title   = 'Olav, der Schweinehirt',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Halvar und Ansgar sind diesmal auf Nummer sicher gegangen, als sie diesen Platz ausgesucht haben. Weit und breit ist keine feindlich gesinnte Menschenseele in Sicht, und es hat genügend Holz und Steine. In Eilmärschen erreichten wir diesen Platz, der nach den Worten unserer Führer zumindest die nächste Zeit Sicherheit vor feindlichem Besuch bieten müsste.\n\nAllerdings sind wir alle ziemlich erschöpft von diesem Gewaltmarsch hierher. Außerdem mussten wir mehrere Wasserläufe mit selbstgefertigten Hängebrücken überqueren, worüber vor allem unsere Soldaten nicht begeistert waren. Sie erklärten, in Zukunft lieber auf einem Schiff seekrank werden zu wollen, als mit Gepäck über diese schwankenden Seilkonstruktionen balancieren zu müssen.',
        msg2    = 'Hier scheint es nie völlig dunkel zu werden. Die Lava eines nordwestlich gelegenen Vulkans erhellt in der Nacht die Umgebung, so dass man selbst um Mitternacht noch ein Tagebuch schreiben könnte. Dafür riecht es hier stets nach Schwefel.\n\nBjarki, Darvi und Elvor, unsere Metallverarbeiter, machen lange Gesichter, weil es so wenig Platz hier für sie hat. Aber wir werden schon etwas finden, wo sie ihre Werkstätten aufbauen können. Und Ymir ist momentan nicht zu beneiden. Er braucht noch mehr Platz für seinen Bauernhof, und muss sein Getreide unter diesen ungünstigen Bedingungen zum Wachsen bringen. Das könnte noch etwas dauern, bis Ymir zum sähen und ernten kommt.\n\nAber unsere Fischer sind hochzufrieden und auch unsere Jäger schauen recht zuversichtlich drein, dass sie zum Zuge kommen können. Und Sigvaldi macht gerade seine Vorratskiste auf, die er sich auf der letzten Insel aufgefüllt hat. Hurra, es gibt leckeres Bier vom Fass für alle!',
        msg3    = 'Halvar und Ansgar sind mit einem Boot auf Erkundungstour gesegelt. Sie wollen nach den Lagerplätzen von eventuell vorhandenen Feinden Ausschau halten und mögliche Schifffahrtswege und Hafenplätze für uns erkunden. Ohne Schiffe geht hier gar nichts, wenn wir nicht wieder auf unsere Hängebrücken zurückgreifen würden wollen. Aber da streiken unsere Leute, und auch mir ist ein Schiff lieber. Vor allem lassen sich damit Lasten effektiver und bequemer transportieren.\n\nKnut hat uns Olav nachgeschickt, und er hat uns glücklich gefunden. Olav ist Landwirt wie unser Ymir, aber er weiß außerdem, wie man Schweine züchtet. Er soll Halldor, unseren Fleischer,  damit versorgen, damit unsere Bergwerker genügend Schinken bekommen können. Leider ist die Gegend hier zwar abgelegen, aber nicht sonderlich geräumig. Für unsere Wirtschaft brauchen wir mehr Platz. Wir müssen dafür sorgen, dass zumindest Bjarki, Elvor und Darvi ihre Werkstätten betreiben können.',
        msg4    = 'So viele steinige und gleichzeitig sumpfige Stellen, wie hier manche Ufer aufweisen, habe ich selten erlebt. Zum Glück ist ein Wikinger normalerweise trittsicher und bei guter Kondition. Die Berge sind voll von Rohstoffen, leider haben wir noch keine Goldfunde gemacht. Überdies sollten wir uns vorsichtig erhalten, um so spät wie möglich von möglichen Feinden gerade im Norden bemerkt zu werden.\n\nWenn wir nur wüssten, ob sie den Bau von Brücken beherrschen, oder ob uns die trennenden Wasserläufe eine gewisse Sicherheit vor Ihnen bieten? Es scheint hier mindestens drei feindliche Lager auf dieser Insel zu geben. Nach allem, was uns Ansgar und Halvar bisher berichtet haben, sind diese Lager auf den höher gelegenen großen Ebenen dieser Insel zu suchen.\n\nElvor und Darvi haben erklärt, dass sie mit dem hier vorhandenen Platz zurechtkommen könnten. Allerdings müsste alle Kohle und der überwiegende Teil des Eisens mit dem Schiff hierher transportiert werden. Aber unsere Steuermänner sind zuversichtlich, dass sie das schaffen.',
        msg5    = 'Das ist schon eine ganz spezielle Gegend, in die wir da reingeraten sind! Da geeignete Hafenplätze hier dünn gesät sind, müssen wir mit dem vorliebnehmen, was an Ort und Stelle vorzufinden ist. Von den erhöhten Standpunkten auf den Hügeln haben wir Blickkontakt mit unserem Hauptquartier, das erleichtert den Warentransport sehr. Allerdings leben unsere Bergwerker ganz überwiegend von Fischen, weil wir bisher nicht so viel Platz zum Wirtschaften gefunden haben, wie wir uns wünschen würden.\n\nNoch haben die Feinde uns nicht aufgestöbert, aber das wird sich sicher bald ändern. Auch mit unseren Schiffen müssen wir vorsichtig sein. Die Steuermänner haben Anweisung, keine Flagge zu zeigen, wenn ihnen jemand begegnen sollte. Mal sehen, wie lange wir unsere Gegner damit täuschen können.\n\nBevor wir sie angreifen können, schauen wir, dass wir unseren Soldaten alles an Münzen und Bier zukommen lassen, was sie brauchen, um stark und tatendurstig zu werden. Und keiner unserer Bergwerker soll Hunger leiden. Wir brauchen alles, was sie an Bodenschätzen aus den Bergen fördern.',
        msg6    = 'Halvar und Ansgar haben sich gründlich umgeschaut und tatsächlich ein Lager unserer Feinde erspäht. Im Süden scheint sich ein Hauptquartier und ein Schiffsanlegeplatz zu befinden. Wirtschaftlich sind sie uns sicherlich weit überlegen, militärisch wahrscheinlich auch, da unsere Späher bei ihnen zahlreiche Bergwerke entdeckt hat. Wir müssen dringend schauen, wie wir zu noch mehr Münzen kommen können. Am besten teilen wir unser weiteres Vorgehen auf.\n\nHalvar schaut nach erfolgversprechenden Hafenplätze und vor allem nach Rohstoffen und Nahrung und einen gangbaren Weg zu unseren Feinden. Ansgar und ich schauen, dass wir wirtschaftlich alles herausholen, was diese Inseln uns an Möglichkeiten übriglassen. Vor allem sollten Ymir und Olav etwas zu tun bekommen.\n\nUnsere Bergwerker können so langsam keine Fische mehr sehen, geschweige denn riechen. Sie haben mich dringend gebeten, ihnen zur Abwechslung einmal Brot und Fleisch zu besorgen, und nicht nur andauernd frischen Fisch.',
        msg7    = 'Wir haben nicht mehr viel Zeit. Halvar hat während seiner Hafensuche das Lager des Feindes genau beobachtet und berichtet, dass dort mobilgemacht wird. Wir sind offensichtlich bemerkt worden und müssen ab jetzt mit einem Angriff rechnen.\n\nGleichzeitig haben Ansgar und Bjarki goldhaltiges Gestein auf unserem Weg gefunden, das beim Abbau verloren gegangen zu sein scheint. Es muss sich um eine längst aufgegebene Fundstätte handeln, weil das Gelände hier insgesamt gesehen einen unberührten Eindruck macht. Also: Äxte und Spitzhacken heraus und überall gründlich nachgeschaut.\n\nOle ist verzweifelt und läuft mit leerem Blick durch die Gegend. Immer dann, wenn seine Werft so richtig läuft, muss er sie wieder abbrechen, um an einer neuen Stelle seine Schiffe bauen zu können. Diese dauernde Umzieherei nervt ihn gewaltig. Der Schiffsbau ist eine verantwortungsvolle Tätigkeit, und da findet Ole es nicht hilfreich, wenn er alle naselang eine neue Werft errichten muss.',
        msg8    = 'Eine verwunschene Gegend ist das hier. Die Gegend ist unberührt, rohstoffreich und von mehreren Wasserfällen durchzogen. Wenn es nicht permanent nach Schwefel riechen würde, könnte man meinen, in einen Märchenwald geraten zu sein. Die dunklen Mineralien erglänzen hier unmittelbar an der Gebirgsoberfläche und spiegeln sich in der Sonne. Das sieht teilweise unwirklich aus. Aber unsere Bergarbeiter und natürlich auch unsere Fischer schauen recht zuversichtlich darein, was die vor uns liegende Landschaft anbetrifft.',
        msg9    = 'Diese Ebene hier ist wie geschaffen für unsere Landwirte. Wir werden das Gelände hier frei räumen von Steinen, Bäumen und eventuellen Feinden, und dann dürfen Ymir und seine Schützlinge Getreide nach Herzenslust säen und ernten.\n\nAuch Magnus, der meinen Vater als Bäcker vertritt, ist ganz entzückt über die Möglichkeiten, die sich ihm hier bieten. Seiner Ansicht nach bietet diese Ebene genug Platz, um alle Bergwerker und auch uns Krieger mit genügend Getreide und Brot versorgen zu können. Und Olav lächelt nur selig in sich hinein, nachdem er ausgiebig die Gegend hier begutachtet hat. Hier hat es auch Platz für ihn und genug Nahrung für seine Schweine. Halldor, unser Fleischer, wird hier richtig zu tun bekommen. Und der Speiseplan für unsere Bergwerker wird endlich etwas abwechslungsreicher und reichhaltiger ausfallen.',
        msg99   = 'Nach langem und zähem Kampf ist unsere kleinste grüne Insel ist wieder an uns gefallen. Nunmehr sind alle weißen, fast alle grauen und einige grüne Inseln wieder in Wikingerhand. Jetzt geht es zuerst wieder zurück zu der Insel des ewigen Schnees, um uns mit meinem Vater Knut und unseren Familien auszutauschen und auch zusammen auszuruhen.\n\nDanach werden wir uns gen Süden wenden, um die noch übriggebliebene graue Insel und die restlichen grünen Inseln wieder in unsere Gewalt zu bekommen. Bei all diesen Unternehmungen nagen Fragen in mir, die ich nicht beantworten kann, und die mir momentan noch niemand beantworten will.\n\nWas könnte Ansgar wissen, was ich noch nicht erfahren darf? Wer ist Ahasversos? Hat er möglicherweise etwas mit dem Feldzug der Babylonier gegen uns Wikinger zu tun? Was für ein Geheimnis birgt der kleine Friedhof auf der Insel des ewigen Schnees? Und was für eine Rolle spielt Prainn? Fragen über Fragen, ich bin gespannt, wer sie mir beantworten kann.'
    },
    en =
    {
        title   = 'Olav, the swineherd',
        name    = 'Enemy Unknown',
        diary   = 'Diary',

        msg1    = 'Halvar and Ansgar played it safe this time when they chose this spot. There is not a single enemy soul in sight for miles, and there is enough wood and stone. We reached this spot in forced marches, which, according to our leaders, should at least provide safety from enemy visits for the time being.\n\nHowever, we are all quite exhausted from the grueling march here. Additionally, we had to cross several watercourses using makeshift suspension bridges, which especially displeased our soldiers. They declared that in the future, they would rather become seasick on a ship than have to balance with luggage on these swaying rope structures.',
        msg2    = 'Here it seems to never get completely dark. The lava of a volcano located to the northwest illuminates the surroundings at night, so that one could even write a diary at midnight. However, it always smells of sulfur here.\n\nBjarki, Darvi, and Elvor, our metalworkers, are making long faces because there is so little space here for them. But we´ll find somewhere to set up their workshops. And Ymir is not to be envied at the moment. He still needs more space for his farm, and must get his grain to grow under these unfavorable conditions. It may take some time before Ymir can start planting and harvesting.\n\nBut our fishermen are very satisfied, and our hunters are looking quite optimistic that they will be able to contribute. And Sigvaldi is just opening his supply box, which he filled on the last island. Hooray, there is delicious draft beer for everyone!',
        msg3    = 'Halvar and Ansgar have sailed out on an expedition. They want to look for enemy camps that might be present and explore potential shipping routes and harbor locations for us. Nothing works here without ships, unless we want to rely on our suspension bridges again. But our people are against that, and I personally prefer a ship. Especially since it allows for more efficient and comfortable transportation of goods.\n\nKnut has sent us Olav, and he found us in good spirits. Olav is a farmer like our Ymir, but he also knows how to breed pigs. He is supposed to provide Halldor, our butcher, with pigs so our miners can have enough ham. Unfortunately, the area here is remote, but not very spacious. We need more space for our economy. We have to make sure that at least Bjarki, Elvor, and Darvi can run their workshops.',
        msg4    = 'So many rocky and simultaneously swampy spots as some of the shores here have, I have rarely experienced. Fortunately, a Viking is usually sure-footed and in good condition. The mountains are full of raw materials, but unfortunately, we haven´t made any gold discoveries yet. Moreover, we should be cautious to be noticed as late as possible by potential enemies, especially in the north.\n\nIf only we knew whether they are skilled in bridge building or if the separating watercourses provide us with some security from them? It seems that there are at least three enemy camps on this island. According to everything Ansgar and Halvar have reported so far, these camps should be located on the higher, larger plains of this island.\n\nElvor and Darvi have stated that they could manage with the available space here. However, all the coal and most of the iron would need to be transported here by ship. But our steersmen are confident that they can manage that.',
        msg5    = 'This is quite a special area we´ve ended up in! Since suitable harbor spots are scarce here, we´ll have to make do with what´s available on site. From the elevated positions on the hills, we have line-of-sight to our headquarters, which makes transporting goods much easier. However, our miners mostly live off fish because we haven´t found as much space for economic activities as we would like.\n\nSo far, the enemies haven´t found us, but that will surely change soon. We also need to be cautious with our ships. The steersmen have been instructed not to display any flags if they encounter anyone. Let´s see how long we can deceive our opponents with that.\n\nBefore we can attack them, we´ll make sure to provide our soldiers with all the coins and beer they need to become strong and eager. And none of our miners should go hungry. We need everything they can mine from the mountains.',
        msg6    = 'Halvar and Ansgar have thoroughly surveyed the area and actually spotted an enemy camp. In the south, there seems to be a headquarters and a docking area for ships. Economically, they are certainly far superior to us, and militarily probably as well, as our scouts have discovered numerous mines in their possession. We urgently need to figure out how to get more coins. It would be best if we split up our further actions.\n\nHalvar will look for promising harbor spots, especially for resources, food, and a feasible path to our enemies. Ansgar and I will ensure we extract all the economic potential these islands have to offer. Above all, Ymir and Olav should be given something to do.\n\nOur miners are starting to get tired of fish, let alone the smell of it. They have urgently asked me to get them bread and meat for a change, and not just fresh fish all the time.',
        msg7    = 'We don´t have much time left. Halvar has carefully observed the enemy camp during his search for harbors and reports that they are mobilizing. We have obviously been noticed and must now expect an attack.\n\nAt the same time, Ansgar and Bjarki have found gold-bearing rock along our path, which seems to have been lost during mining. It must be an abandoned mine because the area here overall gives an untouched impression. So: axes and pickaxes out, and we thoroughly check everywhere.\n\nOle is desperate and walks around with a blank stare. Whenever his shipyard is running smoothly, he has to break it off to build his ships at a new location. This constant moving around is really getting on his nerves. Shipbuilding is a responsible job, and Ole doesn´t find it helpful to have to set up a new shipyard every time.',
        msg8    = 'This is an enchanted area. The region is untouched, rich in resources, and crisscrossed by several waterfalls. If it didn’t constantly smell like sulfur, one might think they had stumbled into a fairytale forest. The dark minerals shine here directly on the mountain surface and reflect in the sunlight. It looks somewhat unreal. But our miners, and of course our fishermen, are quite confident about what the landscape ahead holds for us.',
        msg9    = 'This plain here is perfect for our farmers. We will clear the land of stones, trees, and any potential enemies, and then Ymir and his people can sow and harvest grain to their heart´s content.\n\nMagnus, who represents my father as the baker, is also delighted with the opportunities available here. In his opinion, this plain provides enough space to supply all the miners and even us warriors with enough grain and bread. And Olav is smiling blissfully to himself after thoroughly inspecting the area. There’s room for him here, and enough food for his pigs. Halldor, our butcher, will have plenty of work to do here. And the meal plan for our miners will finally be a bit more varied and abundant.',
        msg99   = 'After a long and tough battle, our smallest green island has once again fallen into our hands. Now all the white, almost all the gray, and some of the green islands are back under Viking control. Now, we will first return to the Island of Eternal Snow to exchange news with my father Knut and our families, and to rest together.\n\nAfter that, we will head south to regain control of the remaining gray island and the other green islands. Throughout these ventures, there are questions gnawing at me that I cannot answer, and that no one wants to answer for me at the moment.\n\nWhat could Ansgar know that I am not yet allowed to find out? Who is Ahasversos? Could he have something to do with the Babylonian campaign against us Vikings? What secret does the small cemetery on the Island of Eternal Snow hold? And what role does Prainn play? Questions upon questions, I wonder who will be able to answer them for me.'
    },
    cs =
    {
        title   = 'Olav, pastevec vepřů',
        name    = 'Neznámý soupeř',
        diary   = 'Deník',

        msg1    = 'Halvar a Ansgar šli tentokrát na jistotu, když vybírali toto místo. Na široko daleko není vidět žádná nepřátelská duše a je zde dostatek dřeva a kamene. Tento bod jsme dosáhli v rychlých pochodech, které, podle našich vůdců, by nám měly alespoň na nějaký čas poskytnout bezpečí před nepřátelskými návštěvami.\n\nNicméně jsme všichni dost vyčerpaní z tohoto náročného pochodu sem. Navíc jsme museli překročit několik vodních toků pomocí improvizovaných visutých mostů, což naše vojáky zvlášť nepotěšilo. Prohlásili, že v budoucnu by raději dostali mořskou nemoc na lodi, než museli balancovat s nákladem na těchto kývajících se lanových konstrukcích.',
        msg2    = 'Zdá se, že zde nikdy není úplná tma. Lava z vulkánu, který se nachází na severozápadě, osvětluje okolí v noci, takže byste si mohli psát deník i o půlnoci. Ale vždy to tu voní po síře.\n\nBjarki, Darvi a Elvor, naši kovodělníci, mají dlouhé tváře, protože tu pro ně není moc místa. Ale určitě najdeme místo, kde si mohou zřídit své dílny. A Ymir momentálně nemá co závidět. Potřebuje více místa pro svou farmu a musí své obilí pěstovat za těchto nepříznivých podmínek. Může to nějakou dobu trvat, než Ymir začne sázet a sklízet.\n\nAle naši rybáři jsou velmi spokojeni a naši lovci vypadají celkem optimisticky, že se dostanou ke svému úkolu. A Sigvaldi právě otevírá svou zásobovací bednu, kterou si naplnil na posledním ostrově. Hurá, pro všechny je tu lahodné pivo z piva!',
        msg3    = 'Halvar a Ansgar vypluli na průzkum. Chtějí se podívat po táborech možných nepřátel a prozkoumat možné obchodní cesty a přístavy pro nás. Bez lodí to tady nefunguje, pokud nechceme opět spoléhat na naše visuté mosty. Ale naši lidé to odmítají, a i já dávám přednost lodi. Zejména proto, že umožňuje efektivnější a pohodlnější přepravu nákladů.\n\nKnut nám poslal Olava, a ten nás našel v dobré náladě. Olav je farmář jako náš Ymir, ale také ví, jak chovat prasata. Má zásobovat Halldora, našeho řezníka, aby naši horníci měli dostatek šunky. Bohužel je oblast tady vzdálená, ale není příliš prostorná. Pro naši ekonomiku potřebujeme více místa. Musíme zajistit, aby alespoň Bjarki, Elvor a Darvi mohli provozovat své dílny.',
        msg4    = 'Tolika kamenitých a zároveň bažinatých míst, jaké některé břehy zde vykazují, jsem málokdy zažil. Naštěstí je Viking obvykle jistý na nohou a v dobré kondici. Hory jsou plné surovin, bohužel jsme zatím neobjevili žádné zlato. Navíc bychom se měli držet opatrně, abychom byli co nejdéle nepozorováni možnými nepřáteli, zvláště na severu.\n\nKdybychom alespoň věděli, zda ovládají stavbu mostů, nebo zda nám oddělující vodní toky poskytují nějakou bezpečnost před nimi? Zdá se, že na tomto ostrově existují alespoň tři nepřátelské tábory. Podle všeho, co nám Ansgar a Halvar zatím řekli, by tyto tábory měly být na vyšších, větších rovinách tohoto ostrova.\n\nElvor a Darvi prohlásili, že si s místem zde dokážou poradit. Musí se však veškeré uhlí a většina železa dopravit sem lodí. Ale naši kormidelníci jsou přesvědčeni, že to zvládnou.',
        msg5    = 'Toto je opravdu zvláštní oblast, do které jsme se dostali! Protože vhodné přístavy jsou zde vzácné, musíme se spokojit s tím, co je k dispozici na místě. Z vyvýšených míst na kopcích máme přímý výhled na naše hlavní stanoviště, což velmi usnadňuje přepravu zboží. Naši horníci však většinou žijí z ryb, protože jsme zatím nenašli tolik prostoru pro hospodaření, kolik bychom si přáli.\n\nZatím nás nepřátelé nenašli, ale to se jistě brzy změní. Také musíme být opatrní se svými loděmi. Kormidelníci mají pokyn, aby nevyvěšovali žádnou vlajku, pokud by někoho potkali. Uvidíme, jak dlouho můžeme naše protivníky tímto způsobem klamat.\n\nNež je budeme moci napadnout, postaráme se, aby naši vojáci měli všechny mince a pivo, které potřebují k tomu, aby byli silní a odhodlaní. A žádný z našich horníků by neměl trpět hladem. Potřebujeme všechno, co mohou vytěžit z hor.',
        msg6    = 'Halvar a Ansgar se důkladně podívali a skutečně spatřili tábor našich nepřátel. Na jihu se zdá, že se nachází hlavní stanoviště a místo pro přistání lodí. Ekonomicky jsou nám určitě daleko nadřazeni, vojensky pravděpodobně také, protože naši špehové u nich objevili množství dolů. Musíme naléhavě zjistit, jak získat více mincí. Nejlépe bude, když rozdělíme naše další kroky.\n\nHalvar se podívá po slibných přístavech a hlavně po surovinách, potravinách a cestě k našim nepřátelům. Ansgar a já se postaráme, abychom z této ostrovní oblasti vytěžili vše, co nám nabízí. Zejména by Ymir a Olav měli dostat něco na práci.\n\nNaši horníci už začínají mít dost ryb, natožpak jejich zápachu. Naléhavě mě požádali, abych jim pro změnu sehnal chléb a maso, a ne jen stále čerstvé ryby.',
        msg7    = 'Nemáme už moc času. Halvar pečlivě pozoroval nepřátelský tábor během svého pátrání po přístavech a hlásí, že tam se mobilizuje. Byli jsme zjevně zaznamenáni a musíme teď počítat s útokem.\n\nSoučasně Ansgar a Bjarki našli zlatonosnou horninu na naší cestě, která se zdá být ztracena při těžbě. Musí se jednat o dávno opuštěný důl, protože okolí zde celkově působí neporušeně. Takže: sekery a krumpáče ven a pořádně se podívat všude.\n\nOle je zoufalý a chodí kolem s prázdným pohledem. Kdykoliv jeho loděnice správně funguje, musí ji zase přerušit, aby mohl postavit své lodě na novém místě. To neustálé stěhování ho opravdu štve. Stavba lodí je zodpovědná činnost a Ole nenachází pomocné, když musí pořád zakládat novou loděnici.',
        msg8    = 'Toto je zakletá oblast. Region je neporušený, bohatý na suroviny a protkán několika vodopády. Kdyby to tu neustále nesmrdělo sírou, mohl by si člověk myslet, že se dostal do pohádkového lesa. Temné minerály se zde přímo na povrchu hor lesknou a odrážejí se na slunci. Vypadá to částečně neskutečně. Ale naši horníci a samozřejmě i naši rybáři jsou docela sebevědomí, pokud jde o krajinu, která nás čeká.',
        msg9    = 'Tato planina je ideální pro naše zemědělce. Uvolníme pozemek od kamenů, stromů a případných nepřátel, a pak mohou Ymir a jeho lidé zasévat a sklízet obilí dle libosti.\n\nMagnus, který zastupuje mého otce jako pekař, je také nadšený z možností, které se mu zde nabízejí. Podle jeho názoru tato planina poskytuje dostatek místa na to, aby mohli zásobit všechny horníky a také nás válečníky dostatkem obilí a chleba. A Olav se usmívá blaženě do sebe poté, co důkladně prozkoumal oblast. Má tu pro sebe místo a dostatek potravy pro svá prasata. Halldor, náš řezník, tu bude mít hodně práce. A jídelní plán pro naše horníky bude konečně o něco rozmanitější a bohatší.',
        msg99   = 'Po dlouhém a tvrdém boji se naše nejmenší zelená ostrov opět dostal zpět do našich rukou. Nyní jsou všechny bílé, téměř všechny šedé a některé zelené ostrovy opět v rukou Vikingů. Teď se nejprve vrátíme na Ostrov věčného sněhu, abychom si vyměnili novinky s mým otcem Knutem a našimi rodinami a také si odpočinuli spolu.\n\nPoté se vydáme na jih, abychom získali zpět zbývající šedý ostrov a další zelené ostrovy. Během těchto výprav mě sužují otázky, na které nedokážu odpovědět, a na které mi momentálně nikdo nechce odpovědět.\n\nCo může Ansgar vědět, co ještě nemám dovoleno zjistit? Kdo je Ahasversos? Může mít něco společného s babylonskou výpravou proti nám Vikingům? Jaké tajemství skrývá malý hřbitov na Ostrově věčného sněhu? A jakou roli hraje Prainn? Otázky na otázky, jsem zvědavý, kdo mi na ně odpoví.'
    },
})

-- format mission texts
function MissionText(e, silent)
    local msg = _('msg' .. tostring(e))

    if(msg ~= ('msg' .. tostring(e))) then
        if not silent then
            rttr:MissionStatement(0, _('diary'), msg .. '\n\n\n\n\n\n\n', IM_AVATAR6, true)
        end
        rttr:SetMissionGoal(0, msg)
    else
        rttr:Log("Error: no Translation found!" .. _(msg))
    end
end

function isMapPreviewEnabled()
    return false;
end

function onSettingsReady()
    checkVersion()
    rttr:Log("-----------------------\n Mission Script loaded... \n-----------------------\n")

    rttr:ResetAddons()
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
    rttr:SetAddon(ADDON_NUM_SCOUTS_EXPLORATION, 4)
    rttr:SetGameSettings({
        ["fow"] = EXP_CLASSIC,
        ["teamView"] = false,
        ["lockedTeams"] = true,
        ["startWares"] = SWR_NORMAL,
        ["objective"] = GO_TOTALDOMINATION
    })

    rttr:GetPlayer(0):SetNation(NAT_VIKINGS)
    rttr:GetPlayer(1):SetNation(NAT_JAPANESE)
    rttr:GetPlayer(2):SetNation(NAT_JAPANESE)
    rttr:GetPlayer(3):SetNation(NAT_BABYLONIANS)
    rttr:GetPlayer(4):SetNation(NAT_BABYLONIANS)

    for p = 1, rttr:GetNumPlayers() - 1 do
        rttr:GetPlayer(p):SetTeam(TM_TEAM1)
        rttr:GetPlayer(p):SetAI(3)
        rttr:GetPlayer(p):SetName(_('name'))
    end
end

function getAllowedChanges()
    return {
        ["addonsAll"]   = false,
        ["addonsSome"]  = true,
        ["ownNation"]   = false,
        ["ownColor"]    = true,
        ["ownTeam"]     = false,
        ["aiNation"]    = false,
        ["aiColor"]     = true,
        ["aiTeam"]      = false
    }
end

function getAllowedAddons()
    return {
        ADDON_TOOL_ORDERING,
        ADDON_CATAPULT_GRAPHICS,
        ADDON_NO_COINS_DEFAULT,
        ADDON_MANUAL_ROAD_ENLARGEMENT,
        ADDON_METALWORKSBEHAVIORONZERO
    }
end

function onStart(isFirstStart)
    for p = 0, rttr:GetNumPlayers() - 1 do
        addPlayerRes(p, not isFirstStart)
    end
    if isFirstStart then
        addExtraSoldiers(1, 20)
        addExtraBoards(2, 50)
        addExtraSoldiers(3, 10)
        addExtraSoldiers(4, 20)
    end
    rttr:GetPlayer(0):ModifyHQ(true)

    eState = {}
    for _, i in ipairs(eIdx) do
        eState[i] = 1
    end

    if not isFirstStart then
        for i = 1, eHist["n"] do
            MissionEvent(eHist[i], true)
        end
    else
        eHist = {["n"] = 0}
    end

    if(isFirstStart) then
        rttr:GetWorld():AddStaticObject(64, 40, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(79, 55, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(30, 66, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(21, 15, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(53,  2, 0, 0, 1)
        rttr:GetWorld():AddStaticObject( 3, 82, 0, 0, 1)
    end
end

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

function addPlayerRes(p, onLoad)
    if (p == 0) then
        rttr:GetPlayer(p):DisableBuilding(BLD_PIGFARM)
        rttr:GetPlayer(p):DisableBuilding(BLD_METALWORKS)
        rttr:GetPlayer(p):DisableBuilding(BLD_DONKEYBREEDER)
    end

    if (p ~= 0 and not onLoad) then
        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 30,
            [GD_BOARDS    ] = 50,
            [GD_STONES    ] = 50,
            [GD_HAM       ] = 2,
            [GD_GRAIN     ] = 2,
            [GD_FLOUR     ] = 2,

            [GD_FISH      ] = 2,
            [GD_MEAT      ] = 2,
            [GD_BREAD     ] = 2,
            [GD_WATER     ] = 2,
            [GD_BEER      ] = 8,
            [GD_COAL      ] = 10,

            [GD_IRONORE   ] = 10,
            [GD_GOLD      ] = 5,
            [GD_IRON      ] = 10,
            [GD_COINS     ] = 5,
            [GD_TONGS     ] = 1,
            [GD_AXE       ] = 7,

            [GD_SAW       ] = 5,
            [GD_PICKAXE   ] = 7,
            [GD_HAMMER    ] = 20,
            [GD_SHOVEL    ] = 7,
            [GD_CRUCIBLE  ] = 7,
            [GD_RODANDLINE] = 7,

            [GD_SCYTHE    ] = 7,
            [GD_CLEAVER   ] = 3,
            [GD_ROLLINGPIN] = 3,
            [GD_BOW       ] = 7,
            [GD_SWORD     ] = 0,
            [GD_SHIELD    ] = 0,

            [GD_BOAT      ] = 8
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 80,
            [JOB_BUILDER            ] = 15,
            [JOB_PLANER             ] = 10,
            [JOB_WOODCUTTER         ] = 5,
            [JOB_FORESTER           ] = 5,
            [JOB_STONEMASON         ] = 5,

            [JOB_FISHER             ] = 5,
            [JOB_HUNTER             ] = 5,
            [JOB_CARPENTER          ] = 2,
            [JOB_FARMER             ] = 5,
            [JOB_PIGBREEDER         ] = 2,
            [JOB_DONKEYBREEDER      ] = 5,

            [JOB_MILLER             ] = 3,
            [JOB_BAKER              ] = 3,
            [JOB_BUTCHER            ] = 2,
            [JOB_BREWER             ] = 2,
            [JOB_MINER              ] = 10,
            [JOB_IRONFOUNDER        ] = 3,

            [JOB_ARMORER            ] = 3,
            [JOB_MINTER             ] = 3,
            [JOB_METALWORKER        ] = 2,
            [JOB_SHIPWRIGHT         ] = 2,
            [JOB_GEOLOGIST          ] = 8,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 20,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 40,
            [JOB_PRIVATEFIRSTCLASS  ] = 2,
            [JOB_SERGEANT           ] = 2,
            [JOB_OFFICER            ] = 2,
            [JOB_GENERAL            ] = 2
        })
    elseif (p == 0 and not onLoad) then
        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 10,
            [GD_BOARDS    ] = 30,
            [GD_STONES    ] = 30,
            [GD_HAM       ] = 3,
            [GD_GRAIN     ] = 3,
            [GD_FLOUR     ] = 3,

            [GD_FISH      ] = 3,
            [GD_MEAT      ] = 4,
            [GD_BREAD     ] = 5,
            [GD_WATER     ] = 3,
            [GD_BEER      ] = 0,
            [GD_COAL      ] = 40,

            [GD_IRONORE   ] = 20,
            [GD_GOLD      ] = 8,
            [GD_IRON      ] = 20,
            [GD_COINS     ] = 3,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 3,

            [GD_SAW       ] = 4,
            [GD_PICKAXE   ] = 8,
            [GD_HAMMER    ] = 18,
            [GD_SHOVEL    ] = 2,
            [GD_CRUCIBLE  ] = 4,
            [GD_RODANDLINE] = 3,

            [GD_SCYTHE    ] = 4,
            [GD_CLEAVER   ] = 3,
            [GD_ROLLINGPIN] = 2,
            [GD_BOW       ] = 0,
            [GD_SWORD     ] = 2,
            [GD_SHIELD    ] = 2,

            [GD_BOAT      ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 80,
            [JOB_BUILDER            ] = 15,
            [JOB_PLANER             ] = 8,
            [JOB_WOODCUTTER         ] = 8,
            [JOB_FORESTER           ] = 2,
            [JOB_STONEMASON         ] = 8,

            [JOB_FISHER             ] = 4,
            [JOB_HUNTER             ] = 8,
            [JOB_CARPENTER          ] = 3,
            [JOB_FARMER             ] = 3,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,

            [JOB_MILLER             ] = 2,
            [JOB_BAKER              ] = 2,
            [JOB_BUTCHER            ] = 2,
            [JOB_BREWER             ] = 2,
            [JOB_MINER              ] = 10,
            [JOB_IRONFOUNDER        ] = 2,

            [JOB_ARMORER            ] = 2,
            [JOB_MINTER             ] = 1,
            [JOB_METALWORKER        ] = 0,
            [JOB_SHIPWRIGHT         ] = 1,
            [JOB_GEOLOGIST          ] = 5,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 30,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 45,
            [JOB_PRIVATEFIRSTCLASS  ] = 15,
            [JOB_SERGEANT           ] = 1,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0
        })
    end
end

function onGameFrame(gf)
    if (gf == 10 and debugTexts) then
        for _, i in ipairs(eIdx) do
            MissionText(i, false)
        end
    end

    enforceBuildingCount(0, BLD_CATAPULT, 3, false)

    if((gf%20)~=0) then
        return
    end

    if(gf==60) then
        -- EVENT1
        MissionEvent(1, false)
    end

    if (eState[2] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_SAWMILL) > 0) then
        -- EVENT2
        MissionEvent(2, false)
    end

    if (eState[3] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_HARBORBUILDING) == 1) then
        -- EVENT3
        MissionEvent(3, false)
    end

    if (eState[4] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_HARBORBUILDING) == 2) then
        -- EVENT4
        MissionEvent(4, false)
    end

    if (eState[5] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_HARBORBUILDING) == 3) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if (eState[6] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_HARBORBUILDING) == 4) then
        -- EVENT6
        MissionEvent(6, false)
    end

    if (eState[7] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_HARBORBUILDING) == 5) then
        -- EVENT7
        MissionEvent(7, false)
    end

    if (eState[8] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_HARBORBUILDING) == 6) then
        -- EVENT8
        MissionEvent(8, false)
    end

    if ((GetNumStorage(1) + GetNumStorage(2) + GetNumStorage(3) + GetNumStorage(4)) < 1) then
        -- EVENT8 (maps to 99)
        MissionEvent(99, false)
    end
end

function onOccupied(p, x, y)
    if(p ~= 0) then return end

    if(eState[9] > 0 and x == 33 and y == 23) then
        -- EVENT9
        MissionEvent(9, false)
    end
end

function MissionEvent(e, onLoad)
    -- event e is inactive
    if(eState[e] <= 0) then
        return
    end

    -- call side effects for active events, check "eState[e] == 1" for multiple call events!
    if(e == 1 and not onLoad) then
        -- nothing

    elseif(e == 2 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_BEER] = 10
        })

    elseif(e == 3 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_FISH      ] = 10,
            [GD_MEAT      ] = 10,
            [GD_BREAD     ] = 10,
        })

    elseif(e == 4 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_COINS] = 10
        })

    elseif(e == 5 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_MEAT] = 10
        })

    elseif(e == 6 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_FISH] = 10
        })

    elseif(e == 7 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_BREAD] = 10
        })

    elseif(e == 8 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_COINS] = 10
        })

    elseif(e == 9) then
         rttr:GetPlayer(0):EnableBuilding(BLD_PIGFARM, not onLoad)

        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_BEER] = 10
            })

            rttr:GetPlayer(0):AddPeople({
                [JOB_PIGBREEDER] = 2
            })
        end

    elseif(e == 99) then
        -- TODO: EnableNextMissions()
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

function GetNumStorage(plr)
    return rttr:GetPlayer(plr):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_HARBORBUILDING) + rttr:GetPlayer(plr):GetNumBuildings(BLD_STOREHOUSE)
end

function GetNumMilitaryBuilding(plr, withHarbor)
    if(withHarbor) then
        return rttr:GetPlayer(plr):GetNumBuildings(BLD_HARBORBUILDING) + rttr:GetPlayer(plr):GetNumBuildings(BLD_BARRACKS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(plr):GetNumBuildings(BLD_WATCHTOWER) + rttr:GetPlayer(plr):GetNumBuildings(BLD_FORTRESS)
    else
        return rttr:GetPlayer(plr):GetNumBuildings(BLD_BARRACKS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(plr):GetNumBuildings(BLD_WATCHTOWER) + rttr:GetPlayer(plr):GetNumBuildings(BLD_FORTRESS)
    end
end

function enforceBuildingCount(player, building, limit, notify)
    local sumBuildings = rttr:GetPlayer(player):GetNumBuildings(building) + rttr:GetPlayer(player):GetNumBuildingSites(building)

    if (sumBuildings >= limit) then
        rttr:GetPlayer(player):DisableBuilding(building)
    else
        rttr:GetPlayer(player):EnableBuilding(building, notify)
    end
end

function addExtraBoards(plrId, amount)
    rttr:GetPlayer(plrId):AddWares({[GD_BOARDS] = amount})
end

function addExtraSoldiers(plrId, amount)
    rttr:GetPlayer(plrId):AddPeople({[JOB_PRIVATE] = amount})
end
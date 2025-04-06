---- Campaign lua version ------
function getRequiredLuaVersion()
    return 1
end

rttr:RegisterTranslations(
{
    en =
    {
        name = 'Die Rückkehr der Wikinger',
        shortDescription = 'Die Rückkehr der Wikinger',
        longDescription= 'Mitten im tiefsten Frieden wird das Volk der Wikinger von den Babyloniern und ihren Verbündeten überfallen und von ihren Inseln vertrieben. Nur eine Zuflucht im äußersten Norden ihres ursprünglichen Reiches bleibt ihnen übrig. Dem König der Wikinger bricht darüber das Herz und seine Trauer über diesen Krieg macht ihn sprachlos und mutlos.\n\nErleben wir miteinander, wie die Wikinger sich unter der Regie von Erik neu erfinden, und Insel um Insel ihres Reiches zurückerobern.'
    }
})

campaign = {
    version = 1,
    author = "Peter Wiem",
    name = _"name",
    shortDescription = _"shortDescription",
    longDescription = _"longDescription",
    image = "<RTTR_GAME>/GFX/PICS/SETUP667.LBM",
    maxHumanPlayers = 1,
    difficulty = "hard",
    mapFolder = "<RTTR_RTTR>/CAMPAIGNS/ERIC",
    luaFolder = "<RTTR_RTTR>/CAMPAIGNS/ERIC",
    maps = { "mcamp01.swd","mcamp02.swd","mcamp03.swd","mcamp04.swd","mcamp05.swd","mcamp06.swd","mcamp07.swd","mcamp08.swd","mcamp09.swd","mcamp10.swd","mcamp11.swd","mcamp12.swd","mcamp13.swd","mcamp14.swd","mcamp15.swd"}
}

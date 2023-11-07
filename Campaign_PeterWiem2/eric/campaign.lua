---- Campaign lua version ------
function getRequiredLuaVersion()
    return 1
end

rttr:RegisterTranslations(
{
    en =
    {
        name = 'Eric Kampagne',
        shortDescription = 'Eric Kampagne',
        longDescription= 'TODO'
    }
})

campaign = {
    version = 1,
    author = "Peter Wiem",
    name = _"name",
    shortDescription = _"shortDescription",
    longDescription = _"longDescription",
    image = "<RTTR_GAME>/GFX/PICS/SETUP802.LBM",
    maxHumanPlayers = 1,
    difficulty = "hard",
    mapFolder = "<RTTR_RTTR>/CAMPAIGNS/ERIC",
    luaFolder = "<RTTR_RTTR>/CAMPAIGNS/ERIC",
    maps = { "mcamp01.swd","mcamp02.swd","mcamp03.swd","mcamp04.swd","mcamp05.swd","mcamp06.swd","mcamp07.swd","mcamp08.swd","mcamp09.swd","mcamp10.swd","mcamp11.swd","mcamp12.swd","mcamp13.swd","mcamp14.swd","mcamp15.swd"}
}

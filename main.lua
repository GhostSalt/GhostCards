local atlas_key = "ghostcards_GhostCards"
local atlas_path = "GhostCards.png"
local atlas_path_hc = "GhostCardsHC.png"

local suits = { "hearts", "clubs", "diamonds", "spades" }
local ranks = { "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace", }

local description = "Ghost"

SMODS.Atlas {
    key = "modicon",
    path = "GhostCardsIcon.png",
    px = 34,
    py = 34
}

SMODS.Atlas {
    key = atlas_key .. "_lc",
    px = 71,
    py = 95,
    path = atlas_path,
    prefix_config = { key = false }
}

if atlas_path_hc then
    SMODS.Atlas {
        key = atlas_key .. "_hc",
        px = 71,
        py = 95,
        path = atlas_path_hc,
        prefix_config = { key = false }
    }
end

for _, suit in ipairs(suits) do
    SMODS.DeckSkin {
        key = suit .. "_skin",
        suit = suit:gsub("^%l", string.upper),
        ranks = ranks,
        lc_atlas = atlas_key .. "_lc",
        hc_atlas = (atlas_path_hc and atlas_key .. "_hc") or atlas_key .. "_lc",
        loc_txt = {
            ["en-us"] = description
        },
        posStyle = "deck"
    }
end

function ghostcards_find_all_on_sheet(mod, sheet)
    local atlas = {}
    for _, v in pairs(SMODS.Centers) do
        if v.original_mod and v.original_mod.id == mod and v.atlas == sheet then
            atlas[#atlas + 1] = v.key
        end
    end
    return atlas
end

local malverk_set_defaults_ref = Malverk.set_defaults
function Malverk.set_defaults()
    malverk_set_defaults_ref()

    for _, v in ipairs(G.P_CENTERS) do
        v.default_pos = v.default_pos or v.pos
        v.pos = v.default_pos
        
        v.default_soul = v.default_soul or v.soul_pos
        v.soul_pos = v.default_soul
    end
end

if next(SMODS.find_mod("malverk")) then
    AltTexture({
        key = "ghost_jokers",
        set = "Joker",
        path = "GhostJokers.png",
        loc_txt = { name = "Vanilla" },
        display_pos = "j_flash",
        original_sheet = true
    })

    local vanilla_textures = { "ghostcards_ghost_jokers" }
    if next(SMODS.find_mod("Cryptid")) then
        AltTexture({
            key = "ghost_jokers_cry_wee_fib",
            set = "Joker",
            path = "GhostJokers.png",
            loc_txt = { name = "Weebonacci" },
            original_sheet = true,
            keys = { "j_cry_wee_fib" }
        })
        vanilla_textures[#vanilla_textures + 1] = "ghostcards_ghost_jokers_cry_wee_fib"
    end

    TexturePack({
        key = "ghost_jokers_main",
        textures = vanilla_textures,
        loc_txt = {
            name = "Ghost Jokers",
            text = { "A set of Jokers", "featuring {C:dark_edition}Ghost{},", "instead of {C:red}Jimbo{}!" }
        }
    })


    for _, v in pairs(SMODS.Centers) do
        if v.soul_pos and not v.default_soul then
            v.default_soul = v.soul_pos
        end
    end

    if next(SMODS.find_mod("Cryptid")) then
        SMODS.Centers.j_cry_wee_fib.atlas = "Joker"

        AltTexture({
            key = "cry_atlasone",
            set = "Joker",
            path = "GhostJokersCryptidOne.png",
            loc_txt = { name = "Misc 1" },
            original_sheet = true,
            keys = ghostcards_find_all_on_sheet("Cryptid", "cry_atlasone"),
            display_pos = "j_cry_pickle"
        })
        AltTexture({
            key = "cry_atlastwo",
            set = "Joker",
            path = "GhostJokersCryptidTwo.png",
            loc_txt = { name = "Misc 2" },
            original_sheet = true,
            keys = ghostcards_find_all_on_sheet("Cryptid", "cry_atlastwo"),
            display_pos = "j_cry_oil_lamp"
        })
        AltTexture({
            key = "cry_atlasthree",
            set = "Joker",
            path = "GhostJokersCryptidThree.png",
            loc_txt = { name = "Misc 3" },
            original_sheet = true,
            keys = ghostcards_find_all_on_sheet("Cryptid", "cry_atlasthree"),
            display_pos = "j_cry_annihalation"
        })
        AltTexture({
            key = "cry_cry_misc",
            set = "Joker",
            path = "GhostJokersCryptidMisc.png",
            loc_txt = { name = "Misc 4" },
            original_sheet = true,
            keys = ghostcards_find_all_on_sheet("Cryptid", "cry_cry_misc"),
            display_pos = "j_cry_doodlem"
        })

        AltTexture({
            key = "cry_jimball",
            set = "Joker",
            path = "GhostJokersCryptidJimball.png",
            loc_txt = { name = "Jimball" },
            original_sheet = true,
            keys = ghostcards_find_all_on_sheet("Cryptid", "cry_jimball"),
            display_pos = "j_cry_jimball"
        })

        AltTexture({
            key = "cry_atlasepic",
            set = "Joker",
            path = "GhostJokersCryptidEpic.png",
            loc_txt = { name = "Epic" },
            original_sheet = true,
            keys = ghostcards_find_all_on_sheet("Cryptid", "cry_atlasepic"),
            display_pos = "j_cry_M"
        })
        AltTexture({
            key = "cry_atlasexotic",
            set = "Joker",
            path = "GhostJokersCryptidExotic.png",
            loc_txt = { name = "Exotic" },
            original_sheet = true,
            keys = ghostcards_find_all_on_sheet("Cryptid", "cry_atlasexotic"),
            display_pos = "j_cry_crustulum"
        })
        AltTexture({
            key = "cry_effarcire",
            set = "Joker",
            path = "GhostJokersCryptidEffarcire.png",
            loc_txt = { name = "Effarcire" },
            original_sheet = true,
            keys = ghostcards_find_all_on_sheet("Cryptid", "cry_effarcire"),
            display_pos = "j_cry_effarcire"
        })
        AltTexture({
            key = "cry_atlasspooky",
            set = "Joker",
            path = "GhostJokersCryptidSpooky.png",
            loc_txt = { name = "Spooky" },
            original_sheet = true,
            keys = ghostcards_find_all_on_sheet("Cryptid", "cry_atlasspooky"),
            display_pos = "j_cry_ghost"
        })

        TexturePack({
            key = "ghost_jokers_cryptid",
            textures = {
                "ghostcards_cry_atlasone",
                "ghostcards_cry_atlastwo",
                "ghostcards_cry_atlasthree",
                "ghostcards_cry_cry_misc",
                "ghostcards_cry_jimball",
                "ghostcards_cry_atlasepic",
                "ghostcards_cry_atlasexotic",
                "ghostcards_cry_effarcire",
                "ghostcards_cry_atlasspooky"
            },
            loc_txt = {
                name = "Ghost Jokers (Cryptid)",
                text = { "{C:dark_edition}Ghost{} has invaded", "{C:attention}Cryptid{}!", "{C:inactive}(When disabling,{}", "{C:inactive}restart the game){}" }
            },
            dynamic_display = true
        })
    end

    

    if next(SMODS.find_mod("Bakery")) then
        AltTexture({
            key = "Bakery",
            set = "Joker",
            path = "GhostJokersBakery.png",
            loc_txt = { name = "Jokers" },
            original_sheet = true,
            keys = ghostcards_find_all_on_sheet("Bakery", "Bakery_Bakery"),
            display_pos = "j_Bakery_Snowball"
        })

        TexturePack({
            key = "ghost_jokers_bakery",
            textures = {
                "ghostcards_Bakery"
            },
            loc_txt = {
                name = "Ghost Jokers (Bakery)",
                text = { "{C:dark_edition}Ghost{} has invaded", "{C:attention}Bakery{}!", "{C:inactive}(When disabling,{}", "{C:inactive}restart the game){}" }
            },
            dynamic_display = true
        })
    end

    

    if next(SMODS.find_mod("artbox")) then
        AltTexture({
            key = "artbox",
            set = "Joker",
            path = "GhostJokersArtBox.png",
            loc_txt = { name = "Jokers" },
            original_sheet = true,
            keys = ghostcards_find_all_on_sheet("artbox", "artb_joker_atlas"),
            display_pos = "j_artb_sadcube"
        })

        TexturePack({
            key = "ghost_jokers_artbox",
            textures = {
                "ghostcards_artbox"
            },
            loc_txt = {
                name = "Ghost Jokers (ArtBox)",
                text = { "{C:dark_edition}Ghost{} has invaded", "{C:attention}ArtBox{}!", "{C:inactive}(When disabling,{}", "{C:inactive}restart the game){}" }
            },
            dynamic_display = true
        })
    end

    

    if next(SMODS.find_mod("aikoyorisshenanigans")) then
        AltTexture({
            key = "aikos",
            set = "Joker",
            path = "GhostJokersAikos.png",
            loc_txt = { name = "Jokers" },
            original_sheet = true,
            keys = ghostcards_find_all_on_sheet("aikoyorisshenanigans", "akyrs_AikoyoriJokers"),
            display_pos = "j_akyrs_henohenomoheji"
        })
        AltTexture({
            key = "aikosguest",
            set = "Joker",
            path = "GhostJokersAikosGuest.png",
            loc_txt = { name = "Guest Jokers" },
            original_sheet = true,
            keys = ghostcards_find_all_on_sheet("aikoyorisshenanigans", "akyrs_guestJokerArts"),
            display_pos = "j_akyrs_maxwells_notebook"
        })

        TexturePack({
            key = "ghost_jokers_aikos",
            textures = {
                "ghostcards_aikos",
                
                "ghostcards_aikosguest"
            },
            loc_txt = {
                name = "Ghost Jokers (Aikoyori's Shenanigans)",
                text = { "{C:dark_edition}Ghost{} has invaded", "{C:attention}Aikoyori's Shenanigans{}!", "{C:inactive}(When disabling,{}", "{C:inactive}restart the game){}" }
            },
            dynamic_display = true
        })
    end
end

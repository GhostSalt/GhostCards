local atlas_key = 'ghostcards_GhostCards'
local atlas_path = 'GhostCards.png'
local atlas_path_hc = 'GhostCardsHC.png'

local suits = { 'hearts', 'clubs', 'diamonds', 'spades' }
local ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace", }

local description = "Ghost"

SMODS.Atlas {
  key = "modicon",
  path = "GhostCardsIcon.png",
  px = 34,
  py = 34
}

SMODS.Atlas {
    key = atlas_key .. '_lc',
    px = 71,
    py = 95,
    path = atlas_path,
    prefix_config = { key = false }
}

if atlas_path_hc then
    SMODS.Atlas {
        key = atlas_key .. '_hc',
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
        lc_atlas = atlas_key .. '_lc',
        hc_atlas = (atlas_path_hc and atlas_key .. '_hc') or atlas_key .. '_lc',
        loc_txt = {
            ['en-us'] = description
        },
        posStyle = 'deck'
    }
end

if next(SMODS.find_mod('malverk')) then
    AltTexture({
        key = 'ghost_jokers',
        set = 'Joker',
        path = 'GhostJokers.png',
        loc_txt = { name = 'Ghost Jokers' },
        display_pos = 'j_flash',
        original_sheet = true
    })

    TexturePack({
        key = 'ghost_jokers_main',
        textures = { 'ghostcards_ghost_jokers' },
        loc_txt = {
            name = 'Ghost Jokers',
            text = { 'A set of Jokers', 'featuring {C:dark_edition}Ghost{},', 'instead of {C:red}Jimbo{}!' }
        }
    })
end
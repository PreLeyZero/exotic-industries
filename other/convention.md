# Mod structure

Short for exotic-industries `ei_` will be used as identifier. All commonly used functions are packed under the lib folder into `ei_lib.`


# Naming convention

The following structure will be used for naming.
Full names are separated by `-` and different sections by `_`

- **Items:** `ei_gold-ingot`
- **Recipes:** `ei_gold-ingot`

there may be sub categories/additional variants
or the recipe name will have additional info to the production way. The item named in a recipe should always be the product, if there is no product or multiple with no clear main product the machine name should be used instead. 

- **Sub-Recipes:** `ei_gold-ingot:casting`
- **Other Sub-Recipe:** `ei_gold-ingot:smelting`
- **No clear main product:** `ei_fusion-reactor:fusing`
- **Void recipe:** `ei_gold-ingot:void`

Technologies and entities are named in the same way.

- **Technology:** `ei_gold-ingot`
- **Entity:** `ei_arc-furnace`

Fluids are named similar, however there may also be different states, which use the same : convention.
Molten metals and other liquid forms of items are also included using `liquid_`. There may be hot/cold versions without using the built in temperature system.

- **Generic fluid:** `ei_dirty-water`
- **Molten metal:** `ei_liquid_gold`
- **Hot lead:** `ei_liquid_lead:hot`

All other prototypes f.e. for subgroups and categories are named the same way. When a recipe category is only associated with one machine then the machine name will be used with a `crafting_` tag before. Categories for multiple entities like advanced-smelting use collective terms instead. 

- **Crafting category for one machine:** `ei_crafting_arc-furnace`
- **Collective terms:** `ei_advanced_crafting`

Functions will be named using `_` f.e. `ei_tech_scaling`. Files containing these scripts will follow the same convention.

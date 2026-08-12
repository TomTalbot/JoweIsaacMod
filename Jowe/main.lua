local mod = RegisterMod("Jowe!", 1)
local Jowe = Isaac.GetItemIdByName("Jowe")
local JoweDamage = 1
local JoweSize = 0.79996013641357
local JoweSpeed = 1.5

function mod:EvaluateCache(player, cacheFlags)
    local itemcount = player:GetCollectibleNum(Jowe)
    
    if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
        local damageToAdd = JoweDamage * itemcount
        player.Damage = player.Damage + damageToAdd
    end
    
    if cacheFlags & CacheFlag.CACHE_SIZE == CacheFlag.CACHE_SIZE then
        player.SpriteScale = player.SpriteScale * (JoweSize ^ itemcount)
    end
    
    if cacheFlags & CacheFlag.CACHE_SPEED == CacheFlag.CACHE_SPEED then
        player.MoveSpeed = player.MoveSpeed * (JoweSpeed ^ itemcount)
    end
end

mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.EvaluateCache)

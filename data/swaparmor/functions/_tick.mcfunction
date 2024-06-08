##armor swap

execute as @a[predicate=swaparmor:sneaking,nbt=!{SelectedItem:{}}] at @s as @e[type=armor_stand,limit=1,sort=nearest,distance=..5,nbt={Glowing:1b}] at @s unless entity @e[type=interaction,limit=1,sort=nearest,distance=..0.5,tag=armor.swap] run summon interaction ~ ~ ~ {height:1.9f,width:0.8f,Tags:["armor.swap"]}
execute as @a[predicate=swaparmor:sneaking,nbt=!{SelectedItem:{}}] at @s as @e[type=armor_stand,limit=1,sort=nearest,distance=..5,nbt={Glowing:1b}] at @s unless entity @e[type=armor_stand,limit=1,sort=nearest,distance=..0.5,tag=armor.swap.placeholder] run summon armor_stand ~ ~ ~ {Tags:["armor.swap.placeholder"],NoGravity:1b,Invisible:1b}
execute as @a[predicate=!swaparmor:sneaking] at @s as @e[type=armor_stand,limit=1,sort=nearest,distance=..5,nbt={Glowing:1b}] at @s if entity @e[type=interaction,limit=1,sort=nearest,distance=..0.5,tag=armor.swap] run kill @e[tag=armor.swap,type=interaction,limit=1,sort=nearest,distance=..0.5]
execute as @a[predicate=!swaparmor:sneaking] at @s as @e[type=armor_stand,limit=1,sort=nearest,distance=..5,nbt={Glowing:1b}] at @s if entity @e[type=armor_stand,limit=1,sort=nearest,distance=..0.5,tag=armor.swap.placeholder] run kill @e[tag=armor.swap.placeholder,type=armor_stand,limit=1,sort=nearest,distance=..0.5]
execute as @e[tag=armor.swap,type=interaction] at @s if data entity @s interaction on target if data entity @s SelectedItem as @e[tag=armor.swap,type=interaction,limit=1,sort=nearest,distance=..0.1] run kill @s
execute as @e[tag=armor.swap,type=interaction] at @s if data entity @s interaction on target run function swaparmor:armor/armor_swap
execute as @e[tag=armor.swap,type=interaction] at @s if data entity @s interaction run data merge entity @e[limit=1,sort=nearest,type=armor_stand,tag=armor.swap.placeholder] {ArmorItems:[{},{},{},{}]}
execute as @e[tag=armor.swap,type=interaction] at @s if data entity @s interaction run data remove entity @s interaction

execute as @a[predicate=swaparmor:sneaking,nbt=!{SelectedItem:{}}] at @s run data merge entity @e[type=armor_stand,limit=1,sort=nearest,distance=..5] {Glowing:1b}
execute as @e[type=armor_stand,nbt={Glowing:1b}] at @s unless entity @a[predicate=swaparmor:sneaking,distance=..5] run data merge entity @s {Glowing:0b}
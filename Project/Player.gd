extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 150
var direction = Vector2(0,0)
var jumpValue = 240
var gravity = 250
var anim_idle = "Idle"
var anim_run = "Run"
var anim_jump = "Jump"
var anim_hurt = "Hurt"
var anim_dead = "Dead"



#var score = 0
var candy = 0
var health = 100
var alive = true
func _ready(): #เพื่อให้ node พร้อมที่จะทำงาน 
	pass
	
func _process(delta): #แถบHP
	$ProgressBar.value = health

func _physics_process(delta):
	
	direction.y += gravity * delta #Gravity เป็นอัตราเร่ง,เพิ่มขึ้นทุกๆวินาที #delta คือ loopเกมรันอยู่
	
	if Input.is_action_pressed("GO_RIGHT"):
		direction.x = speed
		$AnimatedSprite.play(anim_run)
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("GO_LEFT"):
		direction.x = -speed
		$AnimatedSprite.play(anim_run)
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play(anim_idle)
		direction.x = 0
		
	if Input.is_action_pressed("GO_UP") and is_on_floor(): #is_on_floor เป็นฟังก์ชันทีเช็คว่า player อยู่ที่พื้น่
		direction.y = -jumpValue
		$AnimatedSprite.play(anim_jump)
	#elif Input.is_action_pressed("GO_DOWN"):
	#	direction.y = speed
	#else:
	#	direction.y = 0
	
	
	
	#similar print for output
	move_and_slide(direction,Vector2(0,-1)) #ค่า up_direction บอกว่าทิศทางไหนคือด้านบนของเกม 
	pass
	
	#var collision = move_and_collide(Vector2(direction,0))
	#if collision:
	#	if collision.collider.name == "bomb(Clone)":
	#		health = health - 10
			
	#if health < 0:
	#	get_node("AnimatedSprite").play("Dead")
	
#เก็บ Candy	
func GetCandy():
	#candy += 1
	Global.candy += 1
	

#Game over
func hurt():
	health -= 30
	#$AnimatedSprite.play(anim_hurt)
	#set_physics_process(true)
	print(health)
	if health <= 0:
		#alive = false
		#get_node("AnimatedSprite").play("Dead")
		$AnimatedSprite.play(anim_dead)
		set_physics_process(false) #ทำให้ล้มลง
		get_tree().change_scene('res://GameOverNode2D.tscn')

		
		

func heal():
	health += 20
	if health >= 100:
		health = 100
	print(health)
#func deadPlayer():
#	print ("10")
#	if !alive:
#		return
		
#	health -= 10
#	if health == 0:
#		alive = false
#		$AnimatedSprite.play(anim_dead)

func PassDoor():
	#if candy == 4:
		pass
	
func DownFail():
	pass


func _on_Candy_Area2D_my_signal():
	$CandySound.play()


func _on_Bomb_Area2D_signal_bomb():
	$BombSound.play()

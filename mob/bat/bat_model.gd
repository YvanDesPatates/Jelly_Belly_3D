extends Node3D

@onready var animationTree:AnimationTree = %AnimationTree

func hurt():
	animationTree.set("parameters/TakeDammage/request", true)

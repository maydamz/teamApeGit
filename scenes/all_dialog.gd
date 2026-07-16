extends CanvasLayer

var dialogue1 = [
	"Cora: [wave][shake][font_size=30]ANDRO![/font_size][/shake][/wave]",
	"Cora: Hey, what’s up? It’s my birthday today and you didn’t even greet me..",
	"You: [font_size=20]Ulol[/font_size]",
	"Cora: Haaa, you got me.. But really, you didn’t even say good morning earlier.",
	"Cora: You just passed by and went straight to your shop.",
	"You: Oh... sorry, I guess I didn’t notice.",
	"Cora: [color=LightGray][font_size=16][wave freq=4.0]*sigh*[/wave][/font_size][/color] You’re always like that...",
	"Cora: But don’t let everything get to your head, there’s more to life here than you think there is!",
	"Cora: Like, I know you’re not used to this place, but you’re already off to a nice start.",
	"Cora: In my parents’ first two months, they had to use a clothes iron to cook their food...",
	"You: ...",
	"Cora: Anyway, you wanna walk around or something? There’s some good siomai just a few houses down from here.",
	"You: Well... sorry, I don’t have much. I didn’t really earn anything today..",
	"Cora: You sure Andro? You know how I always pay for you, right?",
	"You: ....I just don’t really feel like it right now.",
	"Cora: ...",
	"Cora: Well if you change your mind, I’m right here.",
	"Cora: See ya!",
	"You: [font_size=16]See you.[/font_size]"
]
var dialogue2 = [
	"Cora: Good morning, Andro! You finally answered. \n[font_size=14]I’ve been knocking since earlier, you know.[/font_size]",
	"Cora: I... wanted to see how you were doing.",
	"You: Yeah.. sorry. I woke up late today.",
	"Cora: Well... that’s fine. But don’t make it a habit, okay?",
	"Cora: Starting earlier will definitely get you more buyers!",
	"You: ...",
	"Cora: Now, come on. I have a few minutes left before I gotta do some stuff.",
	"Cora: I cooouuuld walk you to your spot.",
	"You: Don’t worry about that, you’ve done so much for me already.",
	"Cora: Of course, you’re my friend! I’ll always be here for you.",
	"Cora: And considering your situation now.. I really just wanna help you in any way that I can.",
	"Cora: [font_size=22]So please, I insist.[/font_size]",
	"You: Thanks, but I need to figure some things out myself. I... can’t always rely on someone.",
	"Cora: ...",
	"Cora: Okay, I understand.",
	"Cora: Hey, Andro. Go easy on yourself, okay? I promise it’ll get better one day.",
	"Cora: I’ll see you later.",
	"You: ..."
]

var dialogue3 = [
	"Cora: [font_size=22][shake rate=40.0 level=7]Andro, huy Andro, gising![/shake][/font_size]",
	"You: ...",
	"Cora: Finally!",
	"Cora: Jeez, what’s up with you? I went out to buy something for my parents, and here you were, [b]at the middle of the night[/b], just staring blankly at that wall.",
	"Cora: Look, being avoidant for the past few days is one thing, but I’m starting to feel that you’re really losing yourself now.",
	"Cora: You weren’t even responding to my voice!",
	"You: ...",
	"Cora: I know. Maybe you’re not feeling well. Maybe you need a check-up.",
	"Cora: I’ll make an appointment and take you to the hospital myself tomorrow-",
	"You: There’s no need, Cora. Okay lang ako.",
	"You: And besides, where would I get the money to pay you back?",
	"Cora: But-",
	"You: I just need rest, that’s all.",
	"Cora: [color=LightGray][font_size=22][wave freq=2.5]*sigh*[/wave][/font_size][/color] If you say so. But the offer still stands. No need to pay me back, okay?",
	"You: ...",
	"You: I have to get home now. You should, too.",
	"Cora: [wave freq=2.5][font_size=15]Okay... see you.[font_size=15][/wave]"
]

var interactionPlayer = [
	"You: Mam-ser, bili na po kayo ng basahan, pangkabuhayan lang po.",
	"You: Tsong! Maybe you need new rags to replace your old ones? Baka lang po."
]

var interactionNPC = [
	"Stranger: [font_size=15](ignores)[/font_size]",
	"Stranger: Why don’t you get a real job?",
	"Stranger: Kuya, ‘wag mo na akong abalahin, may pupuntahan pa ako!",
	"Stranger: Wala akong maibibigay sa’yo, Kuya."
]

var dialogueDestroy = [
	"UNFINISHED"
]

var dialogueEnding = [
	"UNFINISHED"
]

var controller = false

func _dialogueCreate(scene: Array) -> void:
	var speakers = []
	var dialogues = []
	if controller:
		return
	controller = true
	for i in scene:
		var dialogueParts : PackedStringArray = i.split(": ", true, 1)
		for names in range(0, dialogueParts.size(), 2):
			speakers.append(dialogueParts[names])
		for texts in range(1, dialogueParts.size(), 2):
			dialogues.append(dialogueParts[texts])
	for x in range(speakers.size()):
		$dialogueContainer.display_line(dialogues[x], speakers[x])
		await $dialogueContainer/dialogueTextContainer/dialogueText.tween.finished
		await $dialogueContainer.interactPress 
	$dialogueContainer.close()

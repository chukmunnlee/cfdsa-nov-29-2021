F=(acorn_squash.gif apple.gif bell_pepper.gif blueberries.gif broccoli.gif carrot.gif celery.gif chili_pepper.gif corn.gif eggplant.gif harold.gif lettuce.gif mushroom.gif onion.gif potato.gif)
ARGS=()

for I in {0..14}; do
	ARGS+="--from-file=dov${I}.gif=${F[I]} "
done

echo kubectl create cm fruits-cm $ARGS -oyaml --dry-run=client

# Contribuer

Ce fichier décrit a façon dont vous pouvez nous aider à développer la mission continue de [La Muerta](https://www.lamuerta.fr).

## Dépôt principal

Le dépôt principal de la mission est hébergé [sur Github](https://github.com/lamuerta/DailyWarfare).

Il est accessible en écriture et administré uniquement pour les membres de la team LM.

## Contacter le staff

Les personnes en charge de l'administration du projet sont des membres de notre team.

Les meilleurs moyens d'entrer en contact avec nous sont :

* [Notre Teamspeak](ts3server://ts3.lamuerta.fr)
* [Le forum LM](https://forum.lamuerta.fr)

## Gestion des branches

Le projet utilise une organisation des branches de type [Gitflow](https://nvie.com/posts/a-successful-git-branching-model/).

Nous ajoutons simplement un groupe de branches appelées fork/ pour le code soumis par des contributeurs externes.

### Où travailler

La branche develop n'est pas protégée, les correctifs simples ne nécessitent pas l'ouverture d'une branche feature.
Les modifications simples peuvent donc être effectuées directement sur la branche principale.
Les changements plus complexes, ou ceux dont l'intégration ou non mérite discussion feront l'objet d'une branche feature/.
Ils feront ensuite l'objet d'un pull request avec prise de décision.

## Contributeurs externes

Si vous n'êtes pas membre LM, vous pouvez quand même contribuer au développement de la mission.
Pour cela, nous vous invitons tout simplement à forker notre dépôt.
Vous pourrez alors bénéficier de nos mises à jour via un simple sync et maintenir votre propre version de la mission.

### Réintégrer le dépôt principal

Vous voulez corriger un bug ou ajouter une fonctionnalité susceptible d'être proposée au dépôt principal ?

Vous pouvez ouvrir un pull request mais il y a quelques conditions :
* Le dépôt fork est sync avec notre dépot
* La source est rebasée sur notre dernier comit sur develop
* La cible est une branche fork (demandez-nous de la créer)
* Le titre du PR doit commencer par « Fork - »
* La description du pull request doit indiquer au minimum :
    * Les nouvelles fonctionnalités / bugs couverts
    * L'adresse du fork source du pull request
    * Un moyen de vous recontacter

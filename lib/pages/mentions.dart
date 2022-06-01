import 'package:a2is/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LegalMentionsPage extends StatefulWidget {
  const LegalMentionsPage({Key? key}) : super(key: key);

  @override
  State<LegalMentionsPage> createState() => _LegalMentionsPageState();
}

class _LegalMentionsPageState extends State<LegalMentionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text("Mentions Légales", textAlign: TextAlign.center,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              "I. IDENTIFICATION", style: TextStyle(fontSize: 35),
            ),
            Text(
              "Vous êtes actuellement connecté au site https://www.a2is.fr , propriété de la société SAS A2is. \n "
                  "Dénomination sociale : \n "
                  "A2is \n"
                  "27, Rue de Guerstling"
                  "86450 CHENEVELLES \n"
                  "France \n"
                  "N° SIRET : 901 055 434 00012 \n"
                  "SAS au capital 2000,00 € \n"
                  "RCS Poitiers : 901 055 434 00012 \n"
                  "Code APE/NAF : 4741Z \n"
                  "N° TVA intracommunautaire : FR 9390105543400012 \n"
                  "Représentant légal : M Matthieu PELLETIER \n"
                  "Email : contact@a2is.fr \n"
                  "Téléphone : 09 77 83 05 64 \n"
            ),
            Text(
              "II. HÉBERGEMENT DU SITE", textAlign: TextAlign.center, style: TextStyle(fontSize: 35),
            ),
            Text("La société OVH, SAS, société de droit français, élisant domicile 2 rue Kellermann 59100 Roubaix, "
                "inscrite au RCS de Roubaix au numéro B424 761 419, représentée par M. KLABA, ci-dessous nommée OVH"
            ),
            Text(
              "III. EDITION & PUBLICATION DES CONTENUS", textAlign: TextAlign.center, style: TextStyle(fontSize: 35),
            ),
            Text(
              "Le site SAS A2is est un site de vente en ligne de matériels, logiciels et services informatiques à destination "
                  "de clients professionnels et particuliers. L’édition et la publication de ses contenus est géré par la société elle-même :\n"
                  "SAS A2is \n"
                  "27, Rue du Guerstling \n "
                  "86450 CHENEVELLES \n"
                  "Email : contact@a2is.fr \n"
                  "Tel : 09 77 83 05 64 \n"
                  "Les informations fournies dans ce site, données techniques et photos des produits, "
                  "sont non contractuelles et ne sont données qu’à titre indicatif. "
                  "Seules nous engagent les informations figurant sur la confirmation de commande."
            ),
            Text(
              "IV. POLITIQUE DE COOKIES", textAlign: TextAlign.center, style: TextStyle(fontSize: 35),
            ),
            Text(
              "Les cookies sont des petits fichiers que l’administrateur d’un serveur installe sur votre ordinateur et "
                  "qui permettent de mémoriser des données relatives à l’internaute lorsque celui-ci se connecte au site. "
                  "Nous utilisons le système des cookies uniquement afin de mémoriser des informations destinées à faciliter votre navigation. "
                  "Il ne s’agit en aucun cas de mémoriser des données personnelles vous concernant. \n"
                  "Vous êtes libre de droit de refuser l’installation des cookies ainsi que la collecte de vos informations de navigation. "
                  "Vous pouvez vous opposer à l’enregistrement de « cookies », en tout ou partie, "
                  "en modifiant les options de paramétrage de votre navigateur de la manière suivante : "
                  "https://www.cnil.fr/vos-droits/vos-traces/les-cookies (recommandations de la CNIL). \n"
                  "A quoi servent nos cookies ? \n"
                  "Google : Ce site utilise des cookies publicitaires et de mesure d’audience Google afin d’afficher des annonces publicitaires personnalisées (ciblage et re-ciblage publicitaire), mesurer l’efficacité de ses campagnes et analyser le fonctionnement du site."
            ),
            Text(
              "V. DONNÉES PERSONNELLES", textAlign: TextAlign.center, style: TextStyle(fontSize: 35),
            ),
            Text(
              "Les informations que vous saisirez seront enregistrées par A2is. "
                  "Elles seront analysées et transmises aux différents services concernés pour leur prise en charge. "
                  "Elles pourront en outre, être utilisées par A2is pour des sollicitations marketing et commerciale. "
                  "Si vous ne le souhaitez pas, veuillez le signifier par courrier au gestionnaire du site en écrivant à "
                  "l’adresse suivante : SAS A2is 27, Rue de Guerstling 86450 CHENEVELLES \n"
                  "Vous disposez d’un droit d’accès, de modification, de rectification et de suppression concernant "
                  "les données collectées sur ce site, dans les conditions prévues par la loi n°78-17 du "
                  "6 janvier 1978 relative à l’informatique, aux fichiers et aux libertés."
            ),
            Text(
              "VI. LIENS HYPERTEXTES", textAlign: TextAlign.center, style: TextStyle(fontSize: 35),
            ),
            Text(
              "La création de liens hypertextes vers le site https://www.a2is.fr est "
                  "soumis à l’accord écrit préalable de la société A2is. \n"
                  "A2is n’engage aucunement sa responsabilité à raison de tout lien hypertexte apparaissant "
                  "sur son site et menant à d’autres sites Internet, notamment quant aux contenus et aux pratiques de ces sites."
            ),
            Text(
              "VII. CONDITIONS GÉNÉRALES DE VENTE", textAlign: TextAlign.center, style: TextStyle(fontSize: 35),
            ),
            Text(
              "Les conditions générales de vente relatives au site de vente en ligne SAS A2is sont détaillées sur la "
                  "page dédiée accessible ici."
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String> obtenerPaises() {
  return [
    "Afghanistan",
    "Aland Islands",
    "Albania",
    "Algeria",
    "AmericanSamoa",
    "Andorra",
    "Angola",
    "Anguilla",
    "Antarctica",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Aruba",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bermuda",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
    "British Indian Ocean Territory",
    "Brunei Darussalam",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Cape Verde",
    "Cayman Islands",
    "Central African Republic",
    "Chad",
    "Chile",
    "China",
    "Christmas Island",
    "Cocos (Keeling) Islands",
    "Colombia",
    "Comoros",
    "Congo",
    "Congo, The Democratic Republic of the Congo",
    "Cook Islands",
    "Costa Rica",
    "Cote d'Ivoire",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Ethiopia",
    "Falkland Islands (Malvinas",
    "Faroe Islands",
    "Fiji",
    "Finland",
    "France",
    "French Guiana",
    "French Polynesia",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Gibraltar",
    "Greece",
    "Greenland",
    "Grenada",
    "Guadeloupe",
    "Guam",
    "Guatemala",
    "Guernsey",
    "Guinea",
    "Guinea-Bissau",
    "Guyana",
    "Haiti",
    "Holy See (Vatican City State",
    "Honduras",
    "Hong Kong",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran, Islamic Republic of Persian Gulf",
    "Iraq",
    "Ireland",
    "Isle of Man",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jersey",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "Korea, Democratic People's Republic of Korea",
    "Korea, Republic of South Korea",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libyan Arab Jamahiriya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Macao",
    "Macedonia",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Martinique",
    "Mauritania",
    "Mauritius",
    "Mayotte",
    "Mexico",
    "Micronesia, Federated States of Micronesia",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Montserrat",
    "Morocco",
    "Mozambique",
    "Myanmar",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands",
    "Netherlands Antilles",
    "New Caledonia",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "Niue",
    "Norfolk Island",
    "Northern Mariana Islands",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Palestinian Territory, Occupied",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Perú",
    "Philippines",
    "Pitcairn",
    "Poland",
    "Portugal",
    "Puerto Rico",
    "Qatar",
    "Romania",
    "Russia",
    "Rwanda",
    "Reunion",
    "Saint Barthelemy",
    "Saint Helena, Ascension and Tristan Da Cunha",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Martin",
    "Saint Pierre and Miquelon",
    "Saint Vincent and the Grenadines",
    "Samoa",
    "San Marino",
    "Sao Tome and Principe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "South Sudan",
    "South Georgia and the South Sandwich Islands",
    "Spain",
    "Sri Lanka",
    "Sudan",
    "Suriname",
    "Svalbard and Jan Mayen",
    "Swaziland",
    "Sweden",
    "Switzerland",
    "Syrian Arab Republic",
    "Taiwan",
    "Tajikistan",
    "Tanzania, United Republic of Tanzania",
    "Thailand",
    "Timor-Leste",
    "Togo",
    "Tokelau",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Turks and Caicos Islands",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Venezuela",
    "Vietnam",
    "Virgin Islands, British",
    "Virgin Islands, U.S",
    "Wallis and Futuna",
    "Yemen",
    "Zambia",
    "Zimbabwe",
    // Añade más países según sea necesario
  ];
}

String? stringToImage(String? string) {
  return string;
}

bool? mostrarResultadosBusqueda(
  String? textSearchfor,
  String? textSearchIn,
) {
  if (textSearchfor == null || textSearchIn == null) {
    return false; // Manejar el caso de valores nulos
  }
  String searchTextForLowerCase = textSearchfor.toLowerCase();
  String searchTextInLowerCase = textSearchIn.toLowerCase();

  return searchTextInLowerCase.contains(searchTextForLowerCase);
}

List<String>? listaIntereses() {
  final intereses = [
    "Innovación y Emprendimiento",
    "Marketing y Ventas",
    "Consultoría y Asesoría",
    "Fintech y Finanzas",
    "Negocios e Inversiones",
    "Networking y Eventos",
    "Recursos Humanos y Talento"
  ];
  return intereses;
}

List<DocumentReference> combinarUsuarios(
  DocumentReference ref1,
  DocumentReference ref2,
) {
  return [ref1, ref2];
}

String convertirAminusculas(String valorNombreLista) {
  // List<String> words = valorNombreLista.split(' ');
  // for (int i = 0; i < words.length; i++) {
  //   String word = words[i];
  //   if (word.isNotEmpty) {
  //     words[i] = word[0].toUpperCase() + word.substring(1);
  //   }
  // }
  // return words.join(' ');

  String lowerCaseString =
      valorNombreLista.toLowerCase(); // Convertir toda la cadena a minúsculas
  return lowerCaseString;
}

String? capitalizarPalabras(String? textoParaCapitalizar) {
  List<String> words = textoParaCapitalizar!
      .toLowerCase()
      .split(' '); // Convertir a minúsculas antes de dividir
  for (int i = 0; i < words.length; i++) {
    String word = words[i];
    if (word.isNotEmpty) {
      words[i] = word[0].toUpperCase() +
          word.substring(1); // Capitalizar la primera letra de cada palabra
    }
  }
  return words.join(' ');
}

String? combinarVariableTexto(
  String variable,
  String texto,
) {
  return '$texto $variable';
}

String? sinEspacios(String? emailText) {
  // remove blank spaces from end of email
  return emailText!.trim();
}

String? creaParejasChats(
  String? idA,
  String? idB,
) {
  return '${idA}_$idB';
}

List<MiscontactosRecord> sortNombreFechaMisContactos(
  List<MiscontactosRecord> lista,
  bool ordenarPorNombre,
  bool ordenarPorFecha,
  bool nombreAsc,
  bool fechaAsc,
) {
  if (ordenarPorNombre) {
    if (nombreAsc) {
      lista.sort((a, b) => a.nombrecompleto
          .compareTo(b.nombrecompleto)); // Orden ascendente por nombre
    } else {
      lista.sort((a, b) => b.nombrecompleto
          .compareTo(a.nombrecompleto)); // Orden descendente por nombre
    }
  }
  if (ordenarPorFecha) {
    if (fechaAsc) {
      lista.sort((a, b) =>
          b.fecha!.compareTo(a.fecha!)); // Orden descendente por fecha
    } else {
      lista.sort(
          (a, b) => a.fecha!.compareTo(b.fecha!)); // Orden ascendente por fecha
    }
  }

  return lista;
}

String combinarUrlconUsuario(
  String urlbase,
  String nombreUsuario,
) {
  if (!urlbase.endsWith('/')) {
    urlbase += '/';
  }
  return '$urlbase$nombreUsuario';
}

bool? mostrarResultadosBusquedaNombreEvento(
  String? textSearchFor1,
  String? textSearchFor2,
  String? textSearchIn1,
  String? textSearchIn2,
) {
  if (textSearchFor1 == null ||
      textSearchFor2 == null ||
      textSearchIn1 == null ||
      textSearchIn2 == null) {
    return false; // Manejar el caso de valores nulos
  }

  String searchTextForLowerCase1 = textSearchFor1.toLowerCase();
  String searchTextForLowerCase2 = textSearchFor2.toLowerCase();
  String searchTextInLowerCase1 = textSearchIn1.toLowerCase();
  String searchTextInLowerCase2 = textSearchIn2.toLowerCase();

  return searchTextInLowerCase1.contains(searchTextForLowerCase1) ||
      searchTextInLowerCase2.contains(searchTextForLowerCase2);
}

String imagenPathString(String imagen) {
  return imagen;
}

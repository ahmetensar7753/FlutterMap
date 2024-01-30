const String stationsJSONstr = '''
[
  {
    "id": 1,
    "chargePointId": "station01",
    "name": "Hastane İstasyon",
    "imageLink": "https://images.unsplash.com/photo-1663579748123-00d6a035947e?q=80&w=1594&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "country": "Türkiye",
    "city": "İstanbul",
    "district": "SANCAKTEPE",
    "neighborhood": "EYÜP SULTAN MAHALLESİ",
    "addressDetail": "Hastane otoparkı",
    "latitude": 41.007026,
    "longitude": 29.043595,
    "commentCount": 26,
    "reviewStar": 4.1,
    "stationType": "DC",
    "about": "Hastane - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae ipsum nibh. Aliquam finibus euismod felis sed fringilla. Nam ac diam tincidunt, finibus nisi quis, fringilla urna. Donec eget ipsum lacus. Pellentesque viverra massa sem, et condimentum eros maximus ut. Pellentesque dignissim leo a eros mollis, id posuere orci suscipit. Phasellus posuere odio in urna tincidunt, vel pulvinar ipsum facilisis. Donec est urna, laoreet tincidunt dui non, elementum bibendum dolor.",
    "closestPlacements": [
      { "id": 1, "name": "Camii" },
      { "id": 3, "name": "Park" },
      { "id": 5, "name": "Restoran" },
      { "id": 6, "name": "Eczane" }
    ],
    "connectors": [
      {
        "id": 1,
        "connectorId": 1,
        "socketTypeId": "CSS2",
        "power": 180,
        "status": "Available"
        
      },
      {
        "id": 2,
        "connectorId": 2,
        "socketTypeId": "CSS2",
        "power": 180,
        "status": "In Use"
      }
    ]
  },
  {
    "id": 2,
    "chargePointId": "station02",
    "name": "AVM İstasyon",
    "imageLink": "https://plus.unsplash.com/premium_photo-1664299434025-3f288072a615?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "country": "Türkiye",
    "city": "İstanbul",
    "district": "ATAŞEHİR",
    "neighborhood": "BARBAROS MAHALLESİ",
    "addressDetail": "AVM otoparkı",
    "latitude": 40.987069,
    "longitude": 29.100173,
    "commentCount": 41,
    "reviewStar": 4.6,
    "stationType": "DC",
    "about": "AVM - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae ipsum nibh. Aliquam finibus euismod felis sed fringilla. Nam ac diam tincidunt, finibus nisi quis, fringilla urna. Donec eget ipsum lacus. Pellentesque viverra massa sem, et condimentum eros maximus ut. Pellentesque dignissim leo a eros mollis, id posuere orci suscipit. Phasellus posuere odio in urna tincidunt, vel pulvinar ipsum facilisis. Donec est urna, laoreet tincidunt dui non, elementum bibendum dolor.",
    "closestPlacements": [
      { "id": 1, "name": "Camii" },
      { "id": 2, "name": "AVM" },
      { "id": 3, "name": "Park" },
      { "id": 5, "name": "Restoran" },
      { "id": 4, "name": "Dinlenme Tesisi" },
      { "id": 6, "name": "Eczane" }
    ],
    "connectors": [
      {
        "id": 3,
        "connectorId": 1,
        "socketTypeId": "CHAdeMO",
        "power": 360,
        "status": "Faulted"
      },
      {
        "id": 4,
        "connectorId": 2,
        "socketTypeId": "CHAdeMO",
        "power": 360,
        "status": "In Use"
      }
    ]
  },
  {
    "id": 3,
    "chargePointId": "station03",
    "name": "Otel İstasyon",
    "imageLink": "https://images.unsplash.com/photo-1623079398404-4a024f3f4aee?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "country": "Türkiye",
    "city": "İstanbul",
    "district": "FATİH",
    "neighborhood": "MEVLANAKAPI MAHALLESİ",
    "addressDetail": "Otel otoparkı",
    "latitude": 41.018446,
    "longitude": 28.92612,
    "commentCount": 62,
    "reviewStar": 3.8,
    "stationType": "AC",
    "about": "Otel - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae ipsum nibh. Aliquam finibus euismod felis sed fringilla. Nam ac diam tincidunt, finibus nisi quis, fringilla urna. Donec eget ipsum lacus. Pellentesque viverra massa sem, et condimentum eros maximus ut. Pellentesque dignissim leo a eros mollis, id posuere orci suscipit. Phasellus posuere odio in urna tincidunt, vel pulvinar ipsum facilisis. Donec est urna, laoreet tincidunt dui non, elementum bibendum dolor.",
    "closestPlacements": [
      { "id": 2, "name": "AVM" },
      { "id": 3, "name": "Park" },
      { "id": 5, "name": "Restoran" },
      { "id": 4, "name": "Dinlenme Tesisi" }
    ],
    "connectors": [
      {
        "id": 5,
        "connectorId": 1,
        "socketTypeId": "Type2",
        "power": 18,
        "status": "In Use"
      },
      {
        "id": 6,
        "connectorId": 2,
        "socketTypeId": "Type2",
        "power": 18,
        "status": "In Use"
      }
    ]
  },
  {
    "id": 4,
    "chargePointId": "station04",
    "name": "Stadyum İstasyon",
    "imageLink": "https://images.unsplash.com/photo-1663579748035-8770b734c2a8?q=80&w=1601&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "country": "Türkiye",
    "city": "İzmir",
    "district": "Konak",
    "neighborhood": "MERSİNLİ MAHALLESİ",
    "addressDetail": "Stadyum otoparkı",
    "latitude": 38.437579,
    "longitude": 27.177632,
    "commentCount": 29,
    "reviewStar": 4.2,
    "stationType": "AC",
    "about": "Stadyum - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae ipsum nibh. Aliquam finibus euismod felis sed fringilla. Nam ac diam tincidunt, finibus nisi quis, fringilla urna. Donec eget ipsum lacus. Pellentesque viverra massa sem, et condimentum eros maximus ut. Pellentesque dignissim leo a eros mollis, id posuere orci suscipit. Phasellus posuere odio in urna tincidunt, vel pulvinar ipsum facilisis. Donec est urna, laoreet tincidunt dui non, elementum bibendum dolor.",
    "closestPlacements": [
      { "id": 2, "name": "AVM" },
      { "id": 3, "name": "Park" },
      { "id": 5, "name": "Restoran" },
      { "id": 4, "name": "Dinlenme Tesisi" }
    ],
    "connectors": [
      {
        "id": 7,
        "connectorId": 1,
        "socketTypeId": "Type2",
        "power": 36,
        "status": "In Use"
      },
      {
        "id": 8,
        "connectorId": 2,
        "socketTypeId": "Type2",
        "power": 36,
        "status": "Available"
      }
    ]
  },
  {
    "id": 5,
    "chargePointId": "station05",
    "name": "Park İstasyon",
    "imageLink": "https://images.unsplash.com/photo-1699253801373-dac49c05066f?q=80&w=1630&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "country": "Türkiye",
    "city": "İzmir",
    "district": "Buca",
    "neighborhood": "ATATÜRK MAHALLESİ",
    "addressDetail": "Park otoparkı",
    "latitude": 38.381565,
    "longitude": 27.17907,
    "commentCount": 77,
    "reviewStar": 4.7,
    "stationType": "DC",
    "about": "Park - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae ipsum nibh. Aliquam finibus euismod felis sed fringilla. Nam ac diam tincidunt, finibus nisi quis, fringilla urna. Donec eget ipsum lacus. Pellentesque viverra massa sem, et condimentum eros maximus ut. Pellentesque dignissim leo a eros mollis, id posuere orci suscipit. Phasellus posuere odio in urna tincidunt, vel pulvinar ipsum facilisis. Donec est urna, laoreet tincidunt dui non, elementum bibendum dolor.",
    "closestPlacements": [
      { "id": 1, "name": "Camii" },
      { "id": 2, "name": "AVM" },
      { "id": 3, "name": "Park" },
      { "id": 5, "name": "Restoran" },
      { "id": 4, "name": "Dinlenme Tesisi" },
      { "id": 6, "name": "Eczane" }
    ],
    "connectors": [
      {
        "id": 9,
        "connectorId": 1,
        "socketTypeId": "CCS1",
        "power": 90,
        "status": "Available"
      },
      {
        "id": 10,
        "connectorId": 2,
        "socketTypeId": "CCS1",
        "power": 90,
        "status": "Finishing"
      }
    ]
  },
  {
    "id": 6,
    "chargePointId": "station06",
    "name": "Gazi İstasyon",
    "imageLink": "https://images.unsplash.com/photo-1663008519764-0616547c493a?q=80&w=1656&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "country": "Türkiye",
    "city": "Ankara",
    "district": "Yenimahalle",
    "neighborhood": "EMNİYET MAHALLESİ",
    "addressDetail": "Gazi otoparkı",
    "latitude": 39.939825,
    "longitude": 32.821249,
    "commentCount": 13,
    "reviewStar": 4.5,
    "stationType": "DC",
    "about": "Gazi - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae ipsum nibh. Aliquam finibus euismod felis sed fringilla. Nam ac diam tincidunt, finibus nisi quis, fringilla urna. Donec eget ipsum lacus. Pellentesque viverra massa sem, et condimentum eros maximus ut. Pellentesque dignissim leo a eros mollis, id posuere orci suscipit. Phasellus posuere odio in urna tincidunt, vel pulvinar ipsum facilisis. Donec est urna, laoreet tincidunt dui non, elementum bibendum dolor.",
    "closestPlacements": [
      { "id": 1, "name": "Camii" },
      { "id": 2, "name": "AVM" },
      { "id": 3, "name": "Park" },
      { "id": 4, "name": "Dinlenme Tesisi" }
    ],
    "connectors": [
      {
        "id": 11,
        "connectorId": 1,
        "socketTypeId": "CHAdeMO",
        "power": 180,
        "status": "Unavailable"
      },
      {
        "id": 12,
        "connectorId": 2,
        "socketTypeId": "CHAdeMO",
        "power": 180,
        "status": "Available"
      }
    ]
  }
]
''';

const String mapStyleJSON = ''' [
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "landscape.man_made",
    "elementType": "geometry",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "landscape.man_made",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#e6f8ef"
      },
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "landscape.man_made",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "landscape.natural",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "landscape.natural",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#e6f8ef"
      },
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "landscape.natural.landcover",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "landscape.natural.terrain",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.attraction",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.government",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.medical",
    "elementType": "geometry",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.place_of_worship",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.school",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.sports_complex",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      },
      {
        "weight": 0.5
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#e6f8ef"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#e6f8ef"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text",
    "stylers": [
      {
        "weight": 0.5
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      },
      {
        "weight": 0.5
      }
    ]
  },
  {
    "featureType": "transit",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit.station.bus",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit.station.rail",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  }
] ''';

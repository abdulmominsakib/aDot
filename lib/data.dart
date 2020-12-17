class PlanetInfo {
  final int position;
  final String name;
  final String iconImage;
  final String description;
  final List<String> images;

  PlanetInfo(
    this.position, {
    this.name,
    this.iconImage,
    this.description,
    this.images,
  });
}

List<PlanetInfo> planets = [
  PlanetInfo(1,
      name: 'Mercury',
      iconImage: 'assets/mercury.png',
      description: "mercury_desc",
      images: [
        'https://cdn.pixabay.com/photo/2013/07/18/10/57/mercury-163610_1280.jpg',
        'https://cdn.pixabay.com/photo/2014/07/01/11/38/planet-381127_1280.jpg',
        'https://cdn.pixabay.com/photo/2015/06/26/18/48/mercury-822825_1280.png',
        'https://scx2.b-cdn.net/gfx/news/hires/2015/whatsimporta.jpg'
      ]),
  PlanetInfo(2,
      name: 'Venus',
      iconImage: 'assets/venus.png',
      description: "venus_desc",
      images: [
        'https://cdn.pixabay.com/photo/2011/12/13/14/39/venus-11022_1280.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/a/a9/PIA23791-Venus-NewlyProcessedView-20200608.jpg',
        'https://i.ytimg.com/vi/y_j5dP_Xd-8/maxresdefault.jpg'
      ]),
  PlanetInfo(3,
      name: 'Earth',
      iconImage: 'assets/earth.png',
      description: "earth_desc",
      images: [
        'https://cdn.pixabay.com/photo/2011/12/13/14/31/earth-11015_1280.jpg',
        'https://cdn.pixabay.com/photo/2011/12/14/12/11/astronaut-11080_1280.jpg',
        'https://cdn.pixabay.com/photo/2016/01/19/17/29/earth-1149733_1280.jpg',
        'https://scitechdaily.com/images/Super-Earth-Exoplanet-Illustration.jpg',
      ]),
  PlanetInfo(4,
      name: 'Mars',
      iconImage: 'assets/mars.png',
      description: "mars_desc",
      images: [
        'https://upload.wikimedia.org/wikipedia/commons/0/02/OSIRIS_Mars_true_color.jpg',
        'https://static.scientificamerican.com/sciam/cache/file/B057439A-3F27-48F0-8EA54AF511520AAB_source.jpg',
        'https://www.atse.org.au/wp-content/uploads/2019/09/Mars-Surface-full-width.jpg',
      ]),
  PlanetInfo(5,
      name: 'Jupiter',
      iconImage: 'assets/jupiter.png',
      description: "jupiter_desc",
      images: [
        'https://cdn.britannica.com/66/155966-131-17B5B518/Jupiter.jpg',
        'https://3.bp.blogspot.com/-JzB2ruOjBOs/WJy8tR_tJSI/AAAAAAAABdA/26gANOQ4Y4IZyMnEGS2L8X-dvhVhGL0ZQCLcB/s1600/jupiter_HD.jpg'
      ]),
  PlanetInfo(6,
      name: 'Saturn',
      iconImage: 'assets/saturn.png',
      description: "saturn_desc",
      images: [
        'https://cnet3.cbsistatic.com/img/iyGYweXDFwJJKiS4zAfncsmlOxM=/940x0/2020/07/23/45c1760f-c5dc-43e3-a748-f4d502c2565b/hubblesaturn2020.jpg',
        'https://earthhow.com/wp-content/uploads/2018/06/Saturn.png',
      ]),
  PlanetInfo(7,
      name: 'Uranus',
      iconImage: 'assets/uranus.png',
      description: "uranus_desc",
      images: [
        'https://images.immediate.co.uk/production/volatile/sites/25/2020/05/should-we-send-a-spacecraft-to-explore-uranus-4ec2cb4.jpg?quality=90&resize=768,574',
        'https://earthhow.com/wp-content/uploads/2018/06/Uranus.png',
      ]),
  PlanetInfo(8,
      name: 'Neptune',
      iconImage: 'assets/neptune.png',
      description: "neptune_desc",
      images: [
        'https://www.thegreatcoursesdaily.com/wp-content/uploads/2020/07/Neptune_QBS_ID_0502_9566_L16_3-Main-Featured-Image.jpg',
        'https://media.nature.com/lw800/magazine-assets/d41586-019-00576-1/d41586-019-00576-1_16487340.jpg',
      ]),
];

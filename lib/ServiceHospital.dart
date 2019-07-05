class ServiceDetails {
  const ServiceDetails({this.title, this.hospital, this.rating, this.startPrice, this.endPrice});

  final String title, hospital;
  final int startPrice, endPrice;
  final double rating;
}

const List<ServiceDetails> services = const <ServiceDetails>[
    const ServiceDetails(title: 'Hair Transplant', hospital:"RSPP" , rating: 4.2),
    // const ServiceDetails(title: 'Lip Reduction', quickDetails:"" , procedure: ""),
    // const ServiceDetails(title: 'Breast Implant', quickDetails:"" , procedure: "")
];
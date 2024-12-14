class ShowModel {
  final double? score;
  final Show? show;

  ShowModel({
    this.score,
    this.show,
  });

  ShowModel copyWith({
    double? score,
    Show? show,
  }) {
    return ShowModel(
      score: score ?? this.score,
      show: show ?? this.show,
    );
  }

  ShowModel.fromJson(Map<String, dynamic> json)
      : score = json['score'] as double?,
        show = Show.fromJson(json['show'] as Map<String,dynamic>);

  Map<String, dynamic> toJson() => {
    'score' : score,
    'show' : show?.toJson()
  };
}




class Show {
  final int? id;
  final String? url;
  final String? name;
  final String? type;
  final String? language;
  final List<String>? genres;
  final String? status;
  final int? runtime;
  final int? averageRuntime;
  final String? premiered;
  final String? ended;
  final String? officialSite;
  final Schedule? schedule;
  final Rating? rating;
  final int? weight;
  final WebChannel? webChannel;
  final Externals? externals;
  final Map<String, dynamic>? image;
  final String? summary;
  final int? updated;
  final Links? links;

  Show({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.webChannel,
    this.externals,
    required this.image,
    this.summary,
    this.updated,
    this.links,
  });

  Show.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        url = json['url'] as String?,
        name = json['name'] as String?,
        type = json['type'] as String?,
        language = json['language'] as String?,
        genres = (json['genres'] as List?)?.map((dynamic e) => e as String).toList(),
        status = json['status'] as String?,
        runtime = json['runtime'],
        averageRuntime = json['averageRuntime'],
        premiered = json['premiered'],
        ended = json['ended'],
        officialSite = json['officialSite'],
        schedule = (json['schedule'] as Map<String,dynamic>?) != null ? Schedule.fromJson(json['schedule'] as Map<String,dynamic>) : null,
        rating = (json['rating'] as Map<String,dynamic>?) != null ? Rating.fromJson(json['rating'] as Map<String,dynamic>) : null,
        weight = json['weight'] as int?,
        webChannel = (json['webChannel'] as Map<String,dynamic>?) != null ? WebChannel.fromJson(json['webChannel'] as Map<String,dynamic>) : null,
        externals = (json['externals'] as Map<String,dynamic>?) != null ? Externals.fromJson(json['externals'] as Map<String,dynamic>) : null,
        image = (json['image'] as Map<String, dynamic>?) != null ? json['image'] : null,
        summary = json['summary'] as String?,
        updated = json['updated'] as int?,
        links = (json['_links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['_links'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'url' : url,
    'name' : name,
    'type' : type,
    'language' : language,
    'genres' : genres,
    'status' : status,
    'runtime' : runtime,
    'averageRuntime' : averageRuntime,
    'premiered' : premiered,
    'ended' : ended,
    'officialSite' : officialSite,
    'schedule' : schedule?.toJson(),
    'rating' : rating?.toJson(),
    'weight' : weight,
    'webChannel' : webChannel?.toJson(),
    'externals' : externals?.toJson(),
    'image' : image,
    'summary' : summary,
    'updated' : updated,
    '_links' : links?.toJson()
  };
}

class Schedule {
  final String? time;
  final List<dynamic>? days;

  Schedule({
    this.time,
    this.days,
  });

  Schedule.fromJson(Map<String, dynamic> json)
      : time = json['time'] as String?,
        days = json['days'] as List?;

  Map<String, dynamic> toJson() => {
    'time' : time,
    'days' : days
  };
}

class Rating {
  final dynamic average;

  Rating({
    this.average,
  });

  Rating.fromJson(Map<String, dynamic> json)
      : average = json['average'];

  Map<String, dynamic> toJson() => {
    'average' : average
  };
}

class WebChannel {
  final int? id;
  final String? name;
  final dynamic country;
  final String? officialSite;

  WebChannel({
    this.id,
    this.name,
    this.country,
    this.officialSite,
  });

  WebChannel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        country = json['country'],
        officialSite = json['officialSite'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'country' : country,
    'officialSite' : officialSite
  };
}

class Externals {
  final dynamic tvrage;
  final int? thetvdb;
  final String? imdb;

  Externals({
    this.tvrage,
    this.thetvdb,
    this.imdb,
  });

  Externals.fromJson(Map<String, dynamic> json)
      : tvrage = json['tvrage'],
        thetvdb = json['thetvdb'] as int?,
        imdb = json['imdb'] as String?;

  Map<String, dynamic> toJson() => {
    'tvrage' : tvrage,
    'thetvdb' : thetvdb,
    'imdb' : imdb
  };
}

class Links {
  final Self? self;

  Links({
    this.self,
  });

  Links.fromJson(Map<String, dynamic> json)
      : self = (json['self'] as Map<String,dynamic>?) != null ? Self.fromJson(json['self'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'self' : self?.toJson()
  };
}

class Self {
  final String? href;

  Self({
    this.href,
  });

  Self.fromJson(Map<String, dynamic> json)
      : href = json['href'] as String?;

  Map<String, dynamic> toJson() => {
    'href' : href
  };
}
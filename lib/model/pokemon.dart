
class Pokemon {
    List<String> abilities;
    String detailPageUrl;
    int weight;
    List<String> weakness;
    String number;
    int height;
    String collectiblesSlug;
    String featured;
    String slug;
    String description;
    String name;
    String thumbnailAltText;
    String thumbnailImage;
    int id;
    List<String> type;

    Pokemon({this.abilities, this.detailPageUrl, this.weight, this.weakness, this.number, this.height, this.collectiblesSlug, this.featured, this.slug, this.description, this.name, this.thumbnailAltText, this.thumbnailImage, this.id, this.type});

    Pokemon.fromJson(Map<String, dynamic> json) {
        this.abilities = json["abilities"]==null ? null : List<String>.from(json["abilities"]);
        this.detailPageUrl = json["detailPageURL"];
        this.weight = json["weight"];
        this.weakness = json["weakness"]==null ? null : List<String>.from(json["weakness"]);
        this.number = json["number"];
        this.height = json["height"];
        this.collectiblesSlug = json["collectibles_slug"];
        this.featured = json["featured"];
        this.slug = json["slug"];
        this.description = json["description"];
        this.name = json["name"];
        this.thumbnailAltText = json["thumbnailAltText"];
        this.thumbnailImage = json["thumbnailImage"];
        this.id = json["id"];
        this.type = json["type"]==null ? null : List<String>.from(json["type"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if(this.abilities != null)
            data["abilities"] = this.abilities;
        data["detailPageURL"] = this.detailPageUrl;
        data["weight"] = this.weight;
        if(this.weakness != null)
            data["weakness"] = this.weakness;
        data["number"] = this.number;
        data["height"] = this.height;
        data["collectibles_slug"] = this.collectiblesSlug;
        data["featured"] = this.featured;
        data["slug"] = this.slug;
        data["description"] = this.description;
        data["name"] = this.name;
        data["thumbnailAltText"] = this.thumbnailAltText;
        data["thumbnailImage"] = this.thumbnailImage;
        data["id"] = this.id;
        if(this.type != null)
            data["type"] = this.type;
        return data;
    }
}
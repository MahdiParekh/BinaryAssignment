class Movie
{
late String title,year,imdbID,type,posterurl;

Movie(this.title,this.year,this.imdbID,this.type,this.posterurl);

Movie.fromJson(Map<String,dynamic> json){
  title = json['Title'];
  year = json['Year'];
  imdbID = json['imdbID'];
  type = json['Type'];
  posterurl = json['Poster'];
}
}
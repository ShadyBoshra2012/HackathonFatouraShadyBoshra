import 'package:flutter/material.dart';
import 'package:hackathon_fatura/tasks/third_task/models/movie.dart';
import 'package:hackathon_fatura/tasks/third_task/services/db_service.dart';
import 'package:hackathon_fatura/tasks/third_task/third_task_constants.dart';

class MovieTile extends StatefulWidget {
  final Movie movie;

  const MovieTile({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieTileState createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  bool isFavourited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.0,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                "${ThirdTaskConstants.getImageURL(widget.movie.imagePath)}",
                height: 400.0,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text("${widget.movie.title}"),
                ),
                IconButton(
                  icon: Icon(
                      (isFavourited) ? Icons.favorite : Icons.favorite_outline),
                  onPressed: () async {
                    if (isFavourited)
                      await DBService.instance.delete(widget.movie.id);
                    else
                      await DBService.instance.insert(widget.movie);
                    isFavourited = !isFavourited;
                    setState(() {});
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

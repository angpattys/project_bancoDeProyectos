import 'package:flutter/material.dart';
import 'package:movil181/app/domain/models/models.dart';

class ProjectCard extends StatelessWidget {
  final Projects project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0,7.5),
              blurRadius: 10,
            )
          ]
        ),
        
        child: Stack(
          children: [
            _CardImage(project.image),
            _ProjectDetails(project.name),
            Positioned(
              bottom: 5,
              right: 5,
              child: _CategorieIcon(project.category)
            )
          ],
          
        )
        
      ),
    );
  }
}

class _CategorieIcon extends StatelessWidget {
  final String? innerImage;

  const _CategorieIcon(this.innerImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: FittedBox(
        fit: BoxFit.contain,
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(55),topLeft: Radius.circular(20)),
          child: FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: AssetImage('assets/${innerImage}'),
              fit: BoxFit.cover,
            ),
        ),
      ),
      
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), topLeft: Radius.circular(10))
      ),
    );
  }
}

class _ProjectDetails extends StatelessWidget {
  final String title;

  const _ProjectDetails(this.title);

 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height:40,
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topLeft: Radius.circular(20))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  final String? url;

  const _CardImage(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        child: url == null
          ? Image(
            image: AssetImage('assets/no-image.png'),
            fit: BoxFit.cover
            )
          : FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(url!),
            fit: BoxFit.cover,
          ),
      ),
    );
  }
}
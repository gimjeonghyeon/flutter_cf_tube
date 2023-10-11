import 'package:cf_tube/component/custom_youtube_player.dart';
import 'package:cf_tube/model/video_model.dart';
import 'package:cf_tube/repository/youtube_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,  // 제목 가운데 정렬
        title: Text('트리튜브'),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<VideoModel>>(
        future: YoutubeRepository.getVideos(), // 유튜브 영상 가져오기
        builder: (context, snapshot) {
          if (snapshot.hasError) {  // 에러가 있을 경우 에러 화면에 표시하기
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          if(!snapshot.hasData) { // 로딩중일 때 로딩 위젯 보여주기
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(  // List<VideoModel>을 CustomYoutubePlayer로 매핑
            physics: BouncingScrollPhysics(), // 아래로 당겨서 스크롤할 때 튕기는 애니메이션 추가
            children: snapshot.data!
              .map((e) => CustomYoutubePlayer(videoModel: e))
              .toList(),
          );
        }
      )
    );
  }
}
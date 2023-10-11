import 'package:cf_tube/component/custom_youtube_player.dart';
import 'package:cf_tube/model/video_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomYoutubePlayer(
        videoModel: VideoModel(
          id: 'bTWbQSHrEL4',                  // 샘플 동영상 ID
          title: '매년 달라지는 한정판 추석 선물과 함께한 기분 좋은 ASMR, 들어보실래요? │ 게임회사 문화 │ 트리노드',  // 샘플 제목
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const TwitterLentaApp());
}

class TwitterLentaApp extends StatelessWidget {
  const TwitterLentaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Lenta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TwitterFeedScreen(),
    );
  }
}

class Tweet {
  final String username;
  final String displayName;
  final String content;
  final String timestamp;
  final String avatarUrl;
  final String gifUrl; // URL to GIF image

  Tweet({
    required this.username,
    required this.displayName,
    required this.content,
    required this.timestamp,
    required this.avatarUrl,
    required this.gifUrl,
  });
}

class TwitterFeedScreen extends StatelessWidget {
  final List<Tweet> tweets = [
    Tweet(
      username: 'chel12314',
      displayName: 'John Doe',
      content: 'rainbow unicorn',
      timestamp: '3m ago',
      avatarUrl: 'https://placekitten.com/48/48',
      gifUrl: 'https://i.gifer.com/origin/81/81f29e9614fde38a3d16a62741968976_w200.webp',
    ),
    Tweet(
      username: 'DotaFrog',
      displayName: 'bewareofgod',
      content: 'Авторы Dota 2 опубликовали описание следующего крупного патча для игры в виде эмодзи.',
      timestamp: '15m ago',
      avatarUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3EajnLp4SnsS5cDyC82Ni8qDN4OrtoDAbpiJOBgFl&s',
      gifUrl: 'https://leonardo.osnova.io/92dcb3ed-f710-5457-b743-e5f056f05400/',
    ),
    Tweet(
      username: 'Good_Chill',
      displayName: 'PemP',
      content: 'Тут рандомный человек и ниже рандомный мем (честно хз что ето)',
      timestamp: '1m ago',
      avatarUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStjZax-Ubo38irtdvZ5jKB9YpvS5EfZGN0OQ&usqp=CAU',
      gifUrl: 'https://sun9-10.userapi.com/impf/c854216/v854216912/53e7e/4jnRXjphX0Q.jpg?size=807x454&quality=96&sign=ca2d065596bfea0d733c08f6ca8548a3&c_uniq_tag=q3f-JckS3DD2XlkXZjLuCEN1HnbuKaZxOz8vabaPAy4&type=album',
    ),
    Tweet(
      username: 'smileface',
      displayName: 'Happy',
      content: 'ждемс',
      timestamp: '7m ago',
      avatarUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqJ72SKdktEa6OdvYKxcQnbBCv1l1TX5zDVKHC7ox7mYMWQcWyFoxS6n6jBuqERYOQUhQ&usqp=CAU',
      gifUrl: 'https://media.tenor.com/7YSe06ToFRkAAAAS/eyes.gif',
    ),
    Tweet(
      username: 'Dag',
      displayName: '@Raiz',
      content: 'Рандомный текст: Foreign languages are absolutely necessary for people nowadays. More and more people of different professions decide to study foreign languages in order to raise their professional level. Making business nowadays means the ability to speak at least one foreign language. Among the most popular foreign languages in Russia are English, German, Spanish. French and Italian.',
      timestamp: '38m ago',
      avatarUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfNW-QQ_RtxkSo-2I-5twSGWVs7AEjyO-oGA&usqp=CAU',
      gifUrl: 'https://media.tenor.com/8JC0Q8897jwAAAAS/facepalm-picard.gif',
    ),
    
    // Добавьте свои собственные твиты
  ];

   TwitterFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twitter Lenta'),
      ),
      body: ListView.builder(
        itemCount: tweets.length,
        itemBuilder: (context, index) {
          return TweetCard(tweet: tweets[index]);
        },
      ),
    );
  }
}

class TweetCard extends StatelessWidget {
  final Tweet tweet;

  const TweetCard({super.key, required this.tweet});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(tweet.avatarUrl),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tweet.displayName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '@${tweet.username} • ${tweet.timestamp}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(tweet.content),
          ),
          CachedNetworkImage(
            imageUrl: tweet.gifUrl,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop/data/posts_api.dart';
import 'package:flutter_workshop/data/posts_repository.dart';
import 'package:flutter_workshop/router/app_router.dart';

class WorkshopApp extends StatelessWidget {
  const WorkshopApp({super.key});

  @override
  Widget build(BuildContext context) {
    // RepositoryProvider exposes a single repository to the whole widget tree.
    // Any screen can get it with context.read<PostsRepository>().
    return RepositoryProvider(
      create: (context) => PostsRepository(PostsApi(Dio())),
      child: MaterialApp.router(
        title: 'Flutter Workshop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}

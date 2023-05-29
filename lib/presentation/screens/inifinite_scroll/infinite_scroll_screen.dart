import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  static const name = 'infinite_scroll_screen';

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];

  final ScrollController scrollController = ScrollController();

  bool isLoading = false;

  bool isMounted = true;

  // Cargar más imágenes
  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    // Simulate network delay 2 seconds
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    // Verificar si el componente / widgets está montado
    if (!isMounted) return;
    setState(() {});

    //  mover el scroll al final de la lista
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    // SI EL SCROLL ESTA EN EL FINAL, NO HACER NADA
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    // Simulate network delay 2 seconds
    await Future.delayed(const Duration(seconds: 2));
    if (!isMounted) return;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    isLoading = false;

    // Verificar si el componente / widgets está montado
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        // Load more images
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Infinite Scroll'),
      // ),

      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              // SE LLEGO AL FINAL DE LA LISTA, se muestra un indicador de carga
              if (index == imagesIds.length - 1) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder:
                        const AssetImage('assets/images/jar-loading.gif'),
                    image: NetworkImage(
                        'https://picsum.photos/id/${imagesIds[index]}/500/300'));
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? SpinPerfect(
                infinite: true,
                child: const Icon(Icons.refresh_rounded),
              )
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
    );
  }
}

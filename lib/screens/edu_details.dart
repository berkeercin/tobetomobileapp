import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/educontent/educontent_bloc.dart';
import 'package:tobetomobileapp/blocs/educontent/educontent_event.dart';
import 'package:tobetomobileapp/blocs/educontent/educontent_state.dart';
import 'package:tobetomobileapp/dummydata/profilepage/education.dart';
import 'package:tobetomobileapp/models/home_page/education.dart';
import 'package:tobetomobileapp/screens/edu_module_details.dart';

class EduDetails extends StatefulWidget {
  const EduDetails(
      {Key? key, required this.documentId, required this.contentId})
      : super(key: key);
  final String documentId;
  final String contentId;
  @override
  _EduDetailsState createState() => _EduDetailsState();
}

class _EduDetailsState extends State<EduDetails> {
  late EduContentBloc _eduContentBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eduContentBloc = context.read<EduContentBloc>();
    _eduContentBloc.add(ReloadPage());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _eduContentBloc.add(ReloadPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EduContentBloc, EduContentState>(
      listener: (context, state) {},
      child: BlocBuilder<EduContentBloc, EduContentState>(
        builder: (context, state) {
          if (state is Initialize) {
            context
                .read<EduContentBloc>()
                .add(LoadContent("0", widget.documentId));
            return Scaffold(
              appBar: AppBar(title: const Text("Sayfa yükleniyor...")),
              body: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sayfa yükleniyor..."),
                    CircularProgressIndicator()
                  ],
                ),
              ),
            );
          }
          if (state is LoadedPage) {
            return Scaffold(
              appBar: AppBar(title: Text(state.education.eduTitle)),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: state.education.content.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EduModuleDetails(
                                arrayIndex: index,
                                documentId: widget.documentId,
                                // moduleTitle: state
                                //     .education.content[index].contentTitle
                              ),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blueGrey),
                        child: Center(
                          child: Text(
                            state.education.content[index].contentTitle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(title: const Text("Hata")),
              body: const Center(
                  child: Text("Bilinmeyen bir hata ile karşılaşıldı.")),
            );
          }
        },
      ),
    );
  }
}

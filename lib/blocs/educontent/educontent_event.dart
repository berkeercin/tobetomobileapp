abstract class EduContentEvent {}

class LoadContent extends EduContentEvent {
  final String documentId;
  final String contentId;
  LoadContent(this.contentId, this.documentId);
}

class ReloadPage extends EduContentEvent {}

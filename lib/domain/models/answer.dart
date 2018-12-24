enum AnswerType { NONE, RIGHT, WRONG }

class Answer {
  final AnswerType _type;
  final String colorId;

  const Answer(this._type, this.colorId)
      : assert(_type != null),
        assert(colorId != null);

  bool isRight() => _type == AnswerType.RIGHT;

  bool isNone() => _type == AnswerType.NONE;

  bool isWrong() => _type == AnswerType.WRONG;

  static Answer none() => Answer(AnswerType.NONE, "");

  static Answer right(String colorId) => Answer(AnswerType.RIGHT, colorId);

  static Answer wrong(String colorId) => Answer(AnswerType.WRONG, colorId);
}

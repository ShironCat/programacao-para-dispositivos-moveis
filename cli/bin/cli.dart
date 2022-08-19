class Button {
  double width = 0;
  double height = 0;
  ColorEnum? color;
  String? text;

  Button(this.text, this.color, {this.width = 0, this.height = 0});

  onPressed() {
    print('O botão $text da cor ${color?.toLowerCase()} de largura $width e '
        'altura $height foi pressionado');
  }
}

// ignore: constant_identifier_names
enum ColorEnum { Blue, Red, Gray }

extension ColorEnumImpl on ColorEnum {
  toLowerCase() {
    return name.toLowerCase();
  }
}

void main() {
  var btnSalvar = Button('Salvar', ColorEnum.Blue, height: 30);
  btnSalvar.onPressed();

  var btnCancelar = Button('Cancelar', ColorEnum.Red, width: 50, height: 50);
  btnCancelar.onPressed();

  var btnVoltar = Button('Voltar', ColorEnum.Gray, width: 100);
  btnVoltar.onPressed();
}

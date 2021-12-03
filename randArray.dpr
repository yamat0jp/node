library randArray;

{ DLL �̃������Ǘ��Ɋւ���d�v�ȃ���: �p�����[�^�܂��͊֐����ʂƂ��ĕ������n��
  �葱���܂��͊֐��� DLL ���G�N�X�|�[�g����ꍇ�́AShareMem �����C�u������
  uses �储��уv���W�F�N�g�� uses �� ([�v���W�F�N�g�b�\�[�X�̕\��] ��I��) ��
  �ŏ��ɋL�ڂ���K�v������܂��B����́A
  DLL �Ƃ̊Ԃœn����邷�ׂĂ̕�����ɓ��Ă͂܂�܂��B���R�[�h��N���X��
  �l�X�g����Ă�����̂����l�ł��BShareMem �͋��L������ �}�l�[�W�� BORLNDMM.DLL �ɑ΂���C���^�[�t�F�C�X
  ���j�b�g�ł��B���� DLL �͍쐬�Ώۂ� DLL �ƈꏏ�ɔz�u����K�v��
  ����܂��BBORLNDMM.DLL ���g�p���Ȃ��悤�ɂ���ɂ́APChar �^�܂��� ShortString �^��
  �p�����[�^���g���ĕ��������n���܂��B }

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections;

{$R *.res}

function randomArray(low, high, count: integer): TArray<integer>;
var
  list: TList<integer>;
  i: integer;
begin
  list := TList<integer>.Create;
  try
    for i := low to high do
      list.Add(i);
    result := [];
    Randomize;
    while (count > 0) and (list.count > 0) do
    begin
      i := Random(list.count);
      result := result + [list[i]];
      list.Delete(i);
      dec(count);
    end;
  finally
    list.Free;
  end;
end;

exports randomArray;

begin

end.

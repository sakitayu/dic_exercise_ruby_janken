class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts "自分の数字を入力してください"
    puts "0: グー"
    puts "1: チョキ"
    puts "2: パー"
    return gets.to_i
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    return rand(0..2)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    loop do
      unless player_hand == 0 || player_hand == 1 || player_hand == 2
        puts "0〜2の数字を入力してください。"
      else

        loop do
          #じゃんけんの勝ち負けを判断する計算式を変数calc_resultに代入
          calc_result = (player_hand - enemy_hand + 3) % 3
          #相手の出した手を数字からグーチョキパーに変換して変数enemy_hand_exに代入
          case enemy_hand
          when 0 then enemy_hand_ex = "グー"
          when 1 then enemy_hand_ex = "チョキ"
          when 2 then enemy_hand_ex = "パー"
          end

          case calc_result
          when 2
            puts "相手の手は#{enemy_hand_ex}です。あなたの勝ちです。"
            break
          when 1
            puts "相手の手は#{enemy_hand_ex}です。あなたの負けです。"
            break
          end
          puts "引き分けだよ〜ん。もう一回！" #提出の時は消す
        end
        break
      end
    end

  end
end

# ① player = Player.newの記述の意味↓
# Playerクラスからインスタンスを生成して変数に代入
# ② 大文字のPlayerと小文字のplayerの違い↓
# 大文字のPlayerはクラス、小文字のplayerはインスタンス
player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)

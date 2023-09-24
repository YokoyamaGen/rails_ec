# frozen_string_literal: true

Product.create!(
  [
    {
      name: 'マスタリングTCP/IP　入門編',
      price: 2420,
      description: '豊富な脚注と図版・イラストを用いたわかりやすい解説により、TCP/IPの基本をしっかりと学ぶことができます。',
      category: 'book',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/tcp_ip.jpg')),
                                                    filename: 'tcp_ip')
    },
    {
      name: 'Webを支える技術 ―― HTTP，URI，HTML，そしてREST WEB+DB PRESS plus',
      price: 2827,
      description: 'Webは誕生から20年で爆発的な普及を果たし，17億人のユーザと2億台のサーバを抱える巨大システムへと成長しました。Webがここまで成功した秘密は，その設計思想，いわゆるアーキテクチャにあります。',
      category: 'book',
      image: ActiveStorage::Blob.create_and_upload!(
        io: File.open(Rails.root.join('app/assets/images/technology_supports_web.jpg')), filename: 'supports_web'
      )
    },
    {
      name: '［試して理解］Linuxのしくみ　―実験と図解で学ぶOS、仮想マシン、コンテナの基礎知識【増補改訂版】',
      price: 3520,
      description: 'エンジニアとしてLinuxに関する知識はいまや必須とも言えますが、あなたはそのしくみや動作を具体的にイメージすることができるでしょうか。',
      category: 'book',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/linux.jpg')),
                                                    filename: 'linux')
    },
    {
      name: 'プリンシプル オブ プログラミング 3年目までに身につけたい 一生役立つ101の原理原則',
      price: 2420,
      description: '一通りプログラミングができるようになった。しかし、読みにくい、遅い、頻繁にエラーが発生する、書いたコードを修正すると動かなくなる等々、なかなか「よいコード」を書けないとお悩みではありませんか？',
      category: 'book',
      image: ActiveStorage::Blob.create_and_upload!(
        io: File.open(Rails.root.join('app/assets/images/principles_of_programming.jpg')), filename: 'principles'
      )
    },
    {
      name: 'ロジクール ワイヤレスマウス トラックボール 無線 M575S Bluetooth Unifying 5ボタン windows mac iPad 電池寿命最大24ケ月 M575 ブラック 国内正規品',
      price: 6360,
      description: '10年振りのアップデートとなるトラックボールマウス最新モデル',
      category: 'mouse',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/logi_mouse.jpg')),
                                                    filename: 'logi_mouse')
    },
    {
      name: 'バッファロー 5ボタン Bluetooth 5.0 Blue LED マウス ブラック 戻る/進むボタン搭載 省電力 BSMBB305BK',
      price: 1980,
      description: '【インターフェース】Bluetooth 5.0【センサー方式】BlueLED光学式【分解能DPI】1000 / 1600 / 2400dpi',
      category: 'mouse',
      image: ActiveStorage::Blob.create_and_upload!(
        io: File.open(Rails.root.join('app/assets/images/buffalo_mouse.jpg')), filename: 'buffalo_mouse'
      )
    }

  ]
)

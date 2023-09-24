Product.create!(
  [
    {
      name: 'マスタリングTCP/IP　入門編（第6版',
      price: 2420,
      description: 'TCP/IP解説書の決定版！　時代の変化によるトピックを加え内容を刷新！　本書は、ベストセラーの『マスタリングTCP/IP 入門編』を時代の変化に即したトピックを加え、内容を刷新した第6版として発行するものです。豊富な脚注と図版・イラストを用いたわかりやすい解説により、TCP/IPの基本をしっかりと学ぶことができます。プロトコル、インターネット、ネットワークについての理解を深める最初の一歩として活用ください。',
      category: 'book',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/tcp_ip.jpg')), filename:'tcp_ip'),
    },
    {
      name: 'Webを支える技術 ―― HTTP，URI，HTML，そしてREST WEB+DB PRESS plus',
      price: 2827,
      description: 'Webは誕生から20年で爆発的な普及を果たし，17億人のユーザと2億台のサーバを抱える巨大システムへと成長しました。Webがここまで成功した秘密は，その設計思想，いわゆるアーキテクチャにあります。Webのアーキテクチャ，そしてHTTP，URI，HTMLといったWebを支える技術は，Webがどんなに巨大化しても対応できるように設計されていたのです。私たちが作る個々のWebサービスも，Webのアーキテクチャにのっとることで成功へとつながります。Webのアーキテクチャに正しく適応したWebサービスは，情報が整理され，ユーザの使い勝手が向上し，ほかのサービスと連携しやすくなり，将来的な拡張性が確保されるからです。本書のテーマは，Webサービスの実践的な設計です。まずHTTPやURI，HTMLなどの仕様を歴史や設計思想を織り交ぜて解説します。そしてWebサービスにおける設計課題，たとえば望ましいURI，HTTPメソッドの使い分け，クライアントとサーバの役割分担，設計プロセスなどについて，現時点のベストプラクティスを紹介します。',
      category: 'book',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/technology_supports_web.jpg')), filename:'technology_supports_web'),
    },
    {
      name: '［試して理解］Linuxのしくみ　―実験と図解で学ぶOS、仮想マシン、コンテナの基礎知識【増補改訂版】',
      price: 3520,
      description: 'ITシステムやソフトウェアの基盤OSとして幅広く使われているLinux。エンジニアとしてLinuxに関する知識はいまや必須とも言えますが、あなたはそのしくみや動作を具体的にイメージすることができるでしょうか。本書では、Linux OS における、プロセス管理、プロセススケジューラ、メモリ管理、記憶階層、ファイルシステム、記憶階層、そして仮想化機能、コンテナなど、OS とハードウェアに関するしくみがどのように動くのか、実験とその結果を示す豊富なグラフや図解を用いてわかりやすく解説します。改訂に際しては全面フルカラー化。グラフや図解がさらにわかりやすくなり、ソースコードはC言語から、Go言語とPythonにアップデートしています。さらに仮想化、コンテナなどの章が加わりました。今どきのLinuxのしくみを本書でしっかり理解しておきましょう。',
      category: 'book',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/linux.jpg')), filename:'linux'),
    },
    {
      name: 'プリンシプル オブ プログラミング 3年目までに身につけたい 一生役立つ101の原理原則',
      price: 2420,
      description: '一通りプログラミングができるようになった。しかし、読みにくい、遅い、頻繁にエラーが発生する、書いたコードを修正すると動かなくなる等々、なかなか「よいコード」を書けないとお悩みではありませんか？ 本書は、よいコードを書く上で指針となる前提・原則・思想、つまり「プリンシプル」を解説するプログラミングスキル改善書です。初心者向けの書籍では絶対に説明しない、古今東西のプログラマーの知恵をこの一冊に凝縮しました！',
      category: 'book',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/principles_of_programming.jpg')), filename:'principles_of_programming'),
    },
    {
      name: 'ロジクール ワイヤレスマウス トラックボール 無線 M575S Bluetooth Unifying 5ボタン windows mac iPad 電池寿命最大24ケ月 M575 ブラック 国内正規品',
      price: 6360,
      description: '10年振りのアップデートとなるトラックボールマウス最新モデル',
      category: 'mouse',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/logi_mouse.jpg')), filename:'logi_mouse'),
    },
    {
      name: 'バッファロー 5ボタン Bluetooth 5.0 Blue LED マウス ブラック 戻る/進むボタン搭載 省電力 BSMBB305BK',
      price: 1980,
      description: '【インターフェース】Bluetooth 5.0【センサー方式】BlueLED光学式【分解能DPI】1000 / 1600 / 2400dpi',
      category: 'mouse',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/buffalo_mouse.jpg')), filename:'buffalo_mouse'),
    },

  ]
)
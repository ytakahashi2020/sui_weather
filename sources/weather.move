module weather::weather;

/// 東京の気温だけを保持するシンプルなオブジェクト
public struct Weather has key, store {
    id: UID,
    tokyo: u64,
}

/// 初期化関数（モジュール発行後に自分で呼ぶ）
public fun create(ctx: &mut TxContext) {
    let weather = Weather {
        id: object::new(ctx),
        tokyo: 20, // 初期値
    };
    transfer::share_object(weather);
}

/// 🌡️ setter（気温を更新する）
public fun set_temperature(weather: &mut Weather, temperature: u64) {
    weather.tokyo = temperature;
}

/// 👀 getter（気温を取得する）
public fun get_temperature(weather: &Weather): u64 {
    weather.tokyo
}

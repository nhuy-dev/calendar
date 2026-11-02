// CẤU HÌNH TÙY CHỌN — để trống là app chạy local + mã chia sẻ, vẫn đủ dùng.
// Muốn đồng bộ trực tiếp cho bạn bè thì điền 2 dòng dưới bằng Publishable / anon key
// trong Supabase Project Settings > API. KHÔNG dùng secret/service_role key ở đây,
// và KHÔNG gửi key này qua chat.
window.APP_CONFIG = {
  SUPABASE_URL: "",
  SUPABASE_ANON_KEY: ""
};

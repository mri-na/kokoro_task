document.addEventListener('DOMContentLoaded', function() {
  // ステップ1とステップ2を取得
  const step1 = document.getElementById('step1');
  const step2 = document.getElementById('step2');
  
  // "次へ"ボタンを取得
  const nextButton = document.getElementById('go-to-step2');
  
  // ボタンクリック時の処理
    nextButton.addEventListener('click', function() {
  // ステップ1を非表示、ステップ2を表示
    step1.style.display = 'none';
    step2.style.display = 'block';
  });
});


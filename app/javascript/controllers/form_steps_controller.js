document.addEventListener("DOMContentLoaded", () => {
  const checkboxes = document.querySelectorAll(".color-checkbox");
  const colorDisplay = document.getElementById("average-color");
  const hiddenField = document.getElementById("hidden-average-color"); // 隠しフィールドを取得

  // HEXをRGBに変換
  const hexToRgb = (hex) => {
    const bigint = parseInt(hex.slice(1), 16);
    return [ (bigint >> 16) & 255, (bigint >> 8) & 255, bigint & 255 ];
  };

  // RGBをHEXに変換
  const rgbToHex = (rgb) => {
    return `#${rgb.map((x) => x.toString(16).padStart(2, "0")).join("")}`;
  };

  // 中間色を計算
  const calculateAverageColor = (colors) => {
    const total = colors.reduce(
      (acc, color) => {
        const [r, g, b] = hexToRgb(color);
        acc[0] += r;
        acc[1] += g;
        acc[2] += b;
        return acc;
      },
      [0, 0, 0]
    );

    const count = colors.length;
    return rgbToHex(total.map((value) => Math.round(value / count)));
  };
  

  // チェックボックスが変更されたときの処理
  checkboxes.forEach((checkbox) => {
    checkbox.addEventListener("change", () => {
      const selectedColors = Array.from(checkboxes)
        .filter((checkbox) => checkbox.checked)
        .map((checkbox) => checkbox.dataset.color);

      if (selectedColors.length > 0) {
        const averageColor = calculateAverageColor(selectedColors);
        colorDisplay.style.backgroundColor = averageColor;
        // 隠しフィールドに中間色を設定
        //if (hiddenField) {
        //  hiddenField.value = averageColor;
        //}
      } else {
        colorDisplay.style.backgroundColor = "#ffffff";
        // 隠しフィールドをクリア
        //if (hiddenField) {
        //  hiddenField.value = "";
        //}
      }
    });
  });
});
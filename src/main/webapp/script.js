document.getElementById('toggleButton').addEventListener('click', function() {
  const iframeContainer = document.getElementById('iframeContainer');
  if (iframeContainer.style.display === 'none' || iframeContainer.innerHTML === '') {
    // iframe이 보이지 않거나, iframe이 아직 생성되지 않았다면 iframe을 생성하고 보여줍니다.
    iframeContainer.style.display = 'block';
    if (iframeContainer.innerHTML === '') {
      const iframe = document.createElement('iframe');
      iframe.src = "https://veluga.app/channel/6639d182317b3f8d425c0d23";
      iframe.frameBorder = "0";
      iframeContainer.appendChild(iframe);
    }
  } else {
    // iframe이 이미 보이는 상태라면 숨깁니다.
    iframeContainer.style.display = 'none';
  }
});

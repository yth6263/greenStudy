<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>명상의 시간 | 마음쉼 요가</title>
  <style>
    * { box-sizing: border-box; }
    body { min-height: 100vh; margin: 0; background: radial-gradient(circle at 50% 35%, #244d3d 0, #142c23 45%, #0b1712 100%); color: #f4fbf6; font-family: "Noto Sans KR", "Malgun Gothic", sans-serif; }
    .wrap { width: min(1000px, calc(100% - 32px)); min-height: 100vh; margin: 0 auto; padding: 32px 0 60px; display: flex; flex-direction: column; }
    .top { display: flex; justify-content: flex-end; align-items: center; gap: 12px; }
    .user-id { color: #c8e5d4; font-size: 15px; font-weight: 700; }
    .home { display: inline-flex; align-items: center; justify-content: center; min-height: 40px; padding: 0 16px; border: 1px solid rgba(219, 243, 227, .5); border-radius: 22px; color: #f4fbf6; text-decoration: none; }
    .meditation { flex: 1; display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center; padding: 60px 0; }
    .eyebrow { margin: 0 0 14px; color: #a8d9bd; font-size: 14px; letter-spacing: 3px; }
    h1 { margin: 0; font-size: clamp(30px, 5vw, 48px); font-weight: 700; letter-spacing: -1.5px; }
    .guide { margin: 18px 0 0; color: #d1e1d7; font-size: clamp(16px, 2.5vw, 21px); }
    .music-name { min-height: 24px; margin: 12px 0 0; color: #a8d9bd; font-size: 14px; }
    .clock { margin: 42px 0 36px; color: #fff; font-size: clamp(76px, 16vw, 150px); font-variant-numeric: tabular-nums; font-weight: 300; letter-spacing: 5px; line-height: 1; text-shadow: 0 0 35px rgba(144, 222, 176, .28); }
    .duration { display: flex; flex-wrap: wrap; align-items: center; justify-content: center; gap: 10px; margin-top: 26px; color: #d1e1d7; }
    .duration[hidden] { display: none; }
    .duration input { width: 76px; min-height: 44px; padding: 0 10px; border: 1px solid rgba(219, 243, 227, .45); border-radius: 10px; background: rgba(255, 255, 255, .08); color: #fff; font: inherit; font-size: 17px; text-align: center; }
    .duration input:disabled { opacity: .6; }
    .controls { display: flex; flex-wrap: wrap; justify-content: center; gap: 12px; margin-top: 16px; }
    .start, .change-music { min-height: 52px; padding: 0 26px; border: 0; border-radius: 28px; color: #fff; font: inherit; font-size: 17px; font-weight: 700; cursor: pointer; transition: background .2s, transform .2s; }
    .start { min-width: 160px; background: #42a879; }
    .change-music { background: #355f4a; }
    .start:hover, .change-music:hover { transform: translateY(-2px); }
    .start:hover { background: #51bb89; }
    .change-music:hover { background: #47785f; }
    .waveform { height: 62px; display: flex; align-items: center; justify-content: center; gap: 5px; margin-top: 28px; color: #8be0ad; }
    .waveform span { width: 4px; height: 10px; border-radius: 5px; background: currentColor; opacity: .55; }
    .waveform.playing span { animation: wave .65s ease-in-out infinite alternate; opacity: 1; }
    .waveform.playing span:nth-child(3n) { animation-duration: .48s; }
    .waveform.playing span:nth-child(4n) { animation-duration: .8s; }
    .waveform.playing span:nth-child(5n) { animation-duration: .58s; }
    .waveform span:nth-child(2n) { animation-delay: -.3s; }
    .waveform span:nth-child(3n) { animation-delay: -.5s; }
    @keyframes wave { from { height: 8px; } to { height: 48px; } }
    .hint { margin-top: 18px; color: #afc7b8; font-size: 14px; }
    @media (max-width: 600px) { .wrap { padding-top: 20px; } .top { gap: 9px; } .clock { margin: 35px 0 30px; letter-spacing: 1px; } }
  </style>
</head>
<body>
  <main class="wrap">
    <header class="top">
      <span class="user-id"><c:out value="${sessionScope.sMid}" /></span>
      <a class="home" href="${ctp}/index.yo">홈으로</a>
    </header>
    <section class="meditation" aria-labelledby="meditation-title">
      <p class="eyebrow">MINDFULNESS</p>
      <h1 id="meditation-title">나에게 맞는 시간만큼 명상의 시간을 갖습니다.</h1>
      <p class="guide">편안한 자세로 앉아 천천히 호흡에 집중해보세요.</p>
      <p class="music-name" id="musicName" aria-live="polite"></p>
      <div class="clock" id="timer" role="timer" aria-live="off">06:00</div>
      <div class="duration" id="durationSettings" aria-label="명상 시간 설정">
        <label for="minutesInput">분</label>
        <input id="minutesInput" type="number" min="0" max="999" value="6" inputmode="numeric">
        <label for="secondsInput">초</label>
        <input id="secondsInput" type="number" min="0" max="59" value="0" inputmode="numeric">
      </div>
      <div class="controls">
        <button class="start" id="startButton" type="button">명상 시작</button>
        <button class="change-music" id="changeMusicButton" type="button">랜덤 음악 변경</button>
      </div>
      <div class="waveform" id="waveform" role="img" aria-label="명상 음악 파형"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></div>
      <p class="hint" id="hint">버튼을 누르면 랜덤 명상 사운드와 타이머가 시작됩니다.</p>
    </section>
  </main>
  <script>
    'use strict';

    const meditationModes = [
      { name: '고요한 종소리', root: 110, ratios: [1, 1.125, 1.25, 1.5, 1.667, 2], interval: 5200 },
      { name: '잔잔한 파동', root: 123.47, ratios: [1, 1.2, 1.333, 1.5, 1.8, 2], interval: 3900 },
      { name: '숲의 울림', root: 130.81, ratios: [1, 1.125, 1.333, 1.5, 1.667, 2], interval: 4600 }
    ];
    let currentMode = meditationModes[Math.floor(Math.random() * meditationModes.length)];
    const timerElement = document.getElementById('timer');
    const startButton = document.getElementById('startButton');
    const changeMusicButton = document.getElementById('changeMusicButton');
    const hintElement = document.getElementById('hint');
    const musicNameElement = document.getElementById('musicName');
    const waveformElement = document.getElementById('waveform');
    const durationSettings = document.getElementById('durationSettings');
    const minutesInput = document.getElementById('minutesInput');
    const secondsInput = document.getElementById('secondsInput');
    musicNameElement.textContent = '랜덤 명상음악 · ' + currentMode.name;

    let remainingSeconds = 360;
    let timerId = null;
    let hasStarted = false;
    let isPaused = false;
    let audioContext = null;
    let masterGain = null;
    let chimeId = null;
    let activeOscillators = [];

    function renderTimer() {
      const minutes = Math.floor(remainingSeconds / 60);
      const seconds = remainingSeconds % 60;
      timerElement.textContent = String(minutes).padStart(2, '0') + ':' + String(seconds).padStart(2, '0');
    }

    function playChime() {
      if (!audioContext || !masterGain) return;
      const now = audioContext.currentTime;
      const frequency = currentMode.root * 2 * currentMode.ratios[Math.floor(Math.random() * currentMode.ratios.length)];
      const oscillator = audioContext.createOscillator();
      const envelope = audioContext.createGain();
      oscillator.type = 'sine';
      oscillator.frequency.value = frequency;
      envelope.gain.setValueAtTime(0.0001, now);
      envelope.gain.exponentialRampToValueAtTime(0.12, now + 0.08);
      envelope.gain.exponentialRampToValueAtTime(0.0001, now + 3.2);
      oscillator.connect(envelope);
      envelope.connect(masterGain);
      oscillator.start(now);
      oscillator.stop(now + 3.3);
    }

    function startMusic() {
      const AudioContextClass = window.AudioContext || window.webkitAudioContext;
      if (!AudioContextClass) {
        hintElement.textContent = '이 브라우저에서는 명상 사운드를 재생할 수 없어 타이머만 시작합니다.';
        return;
      }
      audioContext = new AudioContextClass();
      masterGain = audioContext.createGain();
      masterGain.gain.value = 0.22;
      masterGain.connect(audioContext.destination);
      [currentMode.root, currentMode.root * 1.5].forEach(function(frequency, index) {
        const oscillator = audioContext.createOscillator();
        const gain = audioContext.createGain();
        oscillator.type = index === 0 ? 'sine' : 'triangle';
        oscillator.frequency.value = frequency;
        gain.gain.value = index === 0 ? 0.09 : 0.025;
        oscillator.connect(gain);
        gain.connect(masterGain);
        oscillator.start();
        activeOscillators.push(oscillator);
      });
      playChime();
      chimeId = window.setInterval(playChime, currentMode.interval);
      waveformElement.classList.add('playing');
    }

    function startChimes() {
      if (!audioContext || !masterGain) return;
      playChime();
      chimeId = window.setInterval(playChime, currentMode.interval);
    }

    function stopMusic() {
      if (chimeId !== null) window.clearInterval(chimeId);
      chimeId = null;
      activeOscillators.forEach(function(oscillator) {
        try { oscillator.stop(); } catch (error) {}
      });
      activeOscillators = [];
      if (audioContext) {
        audioContext.close();
        audioContext = null;
      }
      masterGain = null;
      waveformElement.classList.remove('playing');
    }

    function setDurationInputsDisabled(disabled) {
      minutesInput.disabled = disabled;
      secondsInput.disabled = disabled;
    }

    function startCountdown() {
      timerId = window.setInterval(function() {
        remainingSeconds -= 1;
        renderTimer();
        if (remainingSeconds <= 0) finishMeditation();
      }, 1000);
    }

    function finishMeditation() {
      window.clearInterval(timerId);
      timerId = null;
      stopMusic();
      hasStarted = false;
      isPaused = false;
      durationSettings.hidden = false;
      setDurationInputsDisabled(false);
      startButton.textContent = '명상 시작';
      changeMusicButton.textContent = '랜덤 음악 변경';
      hintElement.textContent = '명상 시간이 종료되었습니다.';
      window.alert('명상 시간이 종료되었습니다.');
    }

    startButton.addEventListener('click', async function() {
      if (!hasStarted) {
        const minutes = Number(minutesInput.value);
        const seconds = Number(secondsInput.value);
        if (!Number.isInteger(minutes) || minutes < 0 || minutes > 999 || !Number.isInteger(seconds) || seconds < 0 || seconds > 59) {
          window.alert('분은 0~999, 초는 0~59 사이의 숫자로 입력해주세요.');
          return;
        }
        remainingSeconds = (minutes * 60) + seconds;
        if (remainingSeconds <= 0) {
          window.alert('명상 시간을 1초 이상 입력해주세요.');
          return;
        }
        renderTimer();
        hasStarted = true;
        isPaused = false;
        durationSettings.hidden = true;
        setDurationInputsDisabled(true);
        startButton.textContent = '명상 중지';
        hintElement.textContent = '편안하게 호흡하며 지금 이 순간에 집중해보세요.';
        startMusic();
        startCountdown();
        return;
      }
      if (!isPaused) {
        window.clearInterval(timerId);
        timerId = null;
        if (chimeId !== null) window.clearInterval(chimeId);
        chimeId = null;
        if (audioContext && audioContext.state === 'running') await audioContext.suspend();
        waveformElement.classList.remove('playing');
        isPaused = true;
        startButton.textContent = '명상 재시작';
        changeMusicButton.textContent = '명상 재설정';
        hintElement.textContent = '명상이 일시중지되었습니다.';
        return;
      }
      if (audioContext && audioContext.state === 'suspended') {
        await audioContext.resume();
        startChimes();
        waveformElement.classList.add('playing');
      } else {
        startMusic();
      }
      isPaused = false;
      startButton.textContent = '명상 중지';
      changeMusicButton.textContent = '랜덤 음악 변경';
      hintElement.textContent = '편안하게 호흡하며 지금 이 순간에 집중해보세요.';
      startCountdown();
    });

    changeMusicButton.addEventListener('click', function() {
      if (hasStarted && isPaused) {
        window.location.reload();
        return;
      }
      let nextMode = currentMode;
      while (meditationModes.length > 1 && nextMode === currentMode) {
        nextMode = meditationModes[Math.floor(Math.random() * meditationModes.length)];
      }
      currentMode = nextMode;
      musicNameElement.textContent = '랜덤 명상음악 · ' + currentMode.name;
      if (hasStarted && !isPaused) {
        stopMusic();
        startMusic();
      } else if (hasStarted && isPaused) {
        stopMusic();
      }
    });

    renderTimer();
  </script>
</body>
</html>

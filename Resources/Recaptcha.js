(function () {
  let recaptchaId, actionHolderId, testSiteKey, inputEleId;
  testSiteKey = '6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI';
  recaptchaNewId = 'test-recaptcha';
      recaptchaId = 'g-recaptcha';
      inputEleId = 'input-g-recaptcha';
      actionHolderId = 'action-mobile-login';
  var newDiv = document.createElement('div');
  newDiv.id = recaptchaNewId;
  document.getElementById(recaptchaId).parentElement.remove();
  document.getElementById(actionHolderId).append(newDiv);
  grecaptcha.render(recaptchaNewId, {
    sitekey: testSiteKey,
    callback: function (token) {
      document.getElementById(inputEleId).value = token;
    },
  });
})();
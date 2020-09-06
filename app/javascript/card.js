const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  console.log(process)
  console.log(process.env.PAYJP_PUBLIC_KEY)
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("payment[number]"),
      cvc: formData.get("payment[cvc]"),
      exp_month: formData.get("payment[exp_month]"),
      exp_year: `20${formData.get("payment[exp_year]")}`,
     };
     Payjp.createToken(card, (status, response) => {
       console.log(card);
       console.log(status);
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      console.log(response)
      // debugger
      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
      });
    });
  };

window.addEventListener("load", pay);
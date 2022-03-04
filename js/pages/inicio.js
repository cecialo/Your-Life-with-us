import CLIENT from "../api/client.js";
import STORAGE from "../storage.js";

export default Vue.component("LoginPage", {
  data:
    function () {
      return {
        products:[],
        email: '',
        username: '',
        password: '',
      };
    },
  methods: {
    goLogin() {
      this.$router.push("/");
    },
    goProducto() {
      this.$router.push("/producto");
    },
    DoSingnUp: async function () {
      let vm = this;
      try {
        const response = await CLIENT.post('http://silabuz-api-project.herokuapp.com/authentication/sign-up/', {
          email: this.email,
          username: this.username,
          password: this.password,

        });
        STORAGE.push("token", response.token);
        vm.$router.push("/");
      } catch (e) {
        console.warn(e);
        alert("Error al registrarse");
      }
    },
  },
  created: function () {
    const is_logged = !(STORAGE.get("token") == null);
    if (is_logged) {
      this.$router.push("/");
    }
    fetch("https://yourlifewithus.herokuapp.com/api/get_all_products/20")
    .then(response => response.json())
    .then(data => {
        this.products=data.data
    });
  },
  template: `
    <section>
    <header>
      <img src="/images/banner.jpg" alt="..." class="bg_image" style="width: 100%;opacity: 0.50;">
      <div class="d-flex h-100 flex-column align-items-center justify-content-center banner" style="height: 50vh;">
      <!--Cabecera-->
        <h1 class="display-3 fw-bolder">YourLifeWithUs</h1>
        <p class="fw-bold">Cuidando de ti y los tuyos.</p>
        <p class="fw-bold">¿Buscas algo?...¡Nosotros lo tenemos!</p>
        <p class="fw-bold">
          ¿Tienes algun problema?...¡Encontrarás la solución con nosotros!
        </p>
      </div>
    </header>

    <br><br><br>

    <!--CONTENIDO-->
    <main>
    <section class="card container pb-4 mb-5">
        <div>
          <article>
            <h4 class="py-5 text-center">¿Que es "YourLifeWithUs"?</h4>
            <br />
            <p class="px-5 fs-5 text">
              "YourLifeWithUs es una empresa totalmente innovadora, que busca
              ofrecerle los mejores precios al publico en el campo medicinal.
              El objetivo de YourLifeWithUs es revolucionar el mercado de la
              salud, y estamos seguros que lo logrará. "
            </p>
            <p class="fs-6 text fw-bold text-end px-3">
              Angel Mazariegos, CEO.
            </p>
            <div class="d-flex flex-row justify-content-center">
              <img
                src="/images/medtec.jpg"
                alt="..."
                width="300"
                height="200"
              />
              <img
                src="/images/logo.png"
                alt="..."
                width="200"
                height="200"
              />
              <img
                src="/images/tecmed.jpg"
                alt="..."
                width="300"
                height="200"
              />
            </div>
            <br />
            <br />
            <p class="px-3 pt-3">
              Durante los últimos años, la tecnología ha avanzado a pasos
              agigantados y ha permitido el crecimiento de cientos de
              industrias y negocios. La tecnología ha permitido que la
              sociedad evolucione y que encuentre facilidad de movimiento para
              encontrar la solucion a cada problema que encuentre. Las
              facilidades que brinda el Internet y el marketing han logrado
              encontrar la manera de poder comprar lo que queramos, cuando
              queramos. A pesar de ello, existe una industria/necesidad que no
              ha sido abordada adecuadamente: La medicina/salud.
            </p>
            <p class="px-3">
              YourLifeWithUs nació para cubrir esta necesidad social. La
              misión de YourLifeWithUs es ofrecer al consumidor los mejores
              productos del campo medicinal a los mejores precios, para llegar
              a ser la empresa #1 de venta de medicamentos a nivel
              guatemalteco.
            </p>
            <p class="px-3">
              Ademas de eso, YourLifeWithUs, le proporciona al usuario recetas de medicina natural o como
              se le conoce coloquialmente... "remedios", para que puedan tener alternativas en cuanto a costos para poder tratar diferentes padecimientos.
            </p>

          </article>
        </div>
    </section>
    <section class="container mt-5">
            <h2 class="ms-4">Algunos de nuestros productos: </h2>
            <div class="row gx-3 row-cols-2 row-cols-3 row-cols-lg-5 justify-content-center border px-2 py-5">
              <div v-for="product in this.products" class="mb-2">
                <card :product="product" :key="product.id"></card>
              </div>  
            </div>

    </section>
    <section class="mt-5 mb-5">
      <div class="container">
        <div class="card">
            <p class="text-center fw-bold h3 my-5">¿Porque comprar con YourLifeWithUs?</p>
              <div class="d-flex flex-row justify-content-around">
                <div class="py-5 fs-3"><i class="bi bi-cash-coin"> </i> Mejores precios</div>
                <div class="py-5 fs-3"><i class="bi bi-clock"></i>Mejores tiempos</div>
                <div class="py-5 fs-3"><i class="bi bi-gem"></i>Mejores tratos</div>
              </div>
              <p class="px-5 mx-4 mb-5">YourLifeWithUs esta hecho por y para cubrir una necesidad social. Nuestro
                servicio se orienta a facilitar a las familias promedio los mejores Medicamentos
                a los mejores precios. El compromiso de cada empleado de YourLifeWithUs es total, y
                queda demostrado en el trato y servicio que se brinda.
              </p>
        </div>
      </div>
    </section>
    <section class="card container">
    <div class="container mt-5 mb-5">
      <article>
        <h4 class="mt-4 text-center">
          ¿Cúal es nuestro metodo de envío?
        </h4>
        <div class="d-flex justify-content-around align-items-center">
        <div class="px-2">
        <p class="px-3 pt-1">
          El metodo de envío es una de las cosas que hacen a
          YourLifeWithUs distinto. A pesar de ser una empresa con tienda
          fisica, contamos con colaboradores alrededor del pais.
        </p>
        <p class="px-3">
          -El tiempo de entrega dependerá de la ciudad en la
          que resides. El tiempo aproximado de entrega en la capital es de 2 horas, dependiendo de
          la hora y lugar.
        </p>
        <p class="px-3">
          -El monto por compra es de Q.20.00 en las capitales y ciudades
          aledañas.
        </p>
      </div>
        <div class="">
          <img src="/images/repartidor.jpg" alt="..." width="300" height="350" />
        </div>
        </div>
      </article>
    </div>
  </section>
    <section class="mt-5 mb-5">
      <div class="container">
        <div class="card">
              <div class="d-flex flex-row justify-content-between align-items-center py-5">
                <img src="/images/Vacuna_Covid.jpg" alt="" width="30%" height="10%" class="mx-5">
                <p class="mx-5 fs-3"> <b>¿Quieres vacunarte?</b> Recuerda que la vacunación es una responsabilidad social...
                  YourLifeWithUs te aconseja dirigirte con las autoridades sanitarias de tu región para que puedas
                  hacerte de la vacuna contra el Covid-19. Para <a href="https://yomevacuno.gob.gt">Guatemala</a>, <a href="https://coronavirus.gob.mx">México</a>, 
                  <a href="https://www.salud.gob.sv">El Salvador</a> y <a href="https://www.ccss.sa.cr/web/coronavirus/vacunacion">Costa Rica</a>.
                </p>
              </div>
        </div>
      </div>
    </section>
    </main>
</section>
    `,
});
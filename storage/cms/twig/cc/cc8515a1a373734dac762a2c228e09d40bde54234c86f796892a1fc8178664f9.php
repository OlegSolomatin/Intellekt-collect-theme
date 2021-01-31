<?php

use Twig\Environment;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Extension\SandboxExtension;
use Twig\Markup;
use Twig\Sandbox\SecurityError;
use Twig\Sandbox\SecurityNotAllowedTagError;
use Twig\Sandbox\SecurityNotAllowedFilterError;
use Twig\Sandbox\SecurityNotAllowedFunctionError;
use Twig\Source;
use Twig\Template;

/* C:\Users\Pfumiko\Desktop\OpenServer\domains\caforward2/themes/medrum/pages/aboutus.htm */
class __TwigTemplate_308ade56d27d2d80ad33f9b4b519b48f821a613d06fba929e42bbc3a3df319c4 extends \Twig\Template
{
    private $source;
    private $macros = [];

    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->source = $this->getSourceContext();

        $this->parent = false;

        $this->blocks = [
        ];
        $this->sandbox = $this->env->getExtension('\Twig\Extension\SandboxExtension');
        $tags = array("partial" => 2);
        $filters = array();
        $functions = array();

        try {
            $this->sandbox->checkSecurity(
                ['partial'],
                [],
                []
            );
        } catch (SecurityError $e) {
            $e->setSourceContext($this->source);

            if ($e instanceof SecurityNotAllowedTagError && isset($tags[$e->getTagName()])) {
                $e->setTemplateLine($tags[$e->getTagName()]);
            } elseif ($e instanceof SecurityNotAllowedFilterError && isset($filters[$e->getFilterName()])) {
                $e->setTemplateLine($filters[$e->getFilterName()]);
            } elseif ($e instanceof SecurityNotAllowedFunctionError && isset($functions[$e->getFunctionName()])) {
                $e->setTemplateLine($functions[$e->getFunctionName()]);
            }

            throw $e;
        }

    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 1
        echo "<div class=\"container-main\">
    ";
        // line 2
        $context['__cms_partial_params'] = [];
        echo $this->env->getExtension('Cms\Twig\Extension')->partialFunction("infonav"        , $context['__cms_partial_params']        , true        );
        unset($context['__cms_partial_params']);
        // line 3
        echo "    <div class=\"container-main-aboutus\">
        <h2>О компании</h2>
        <div class=\"container-main-position\">
            <section>
                <p>Профессиональное коллекторское агентство, предоставляющее услуги полного цикла взыскания просроченной задолженности, а также организацию и сопровождение взыскания в рамках судебного и исполнительного производств.</p>
            </section>
            <seection>
                <p>Компания осуществляет свою деятельность в рамках действующего законодательства РФ, соблюдая этические нормы и уважая интересы всех лиц, задействованных в процессе взыскания.</p>
            </seection>
        </div>
    </div>
</div>";
    }

    public function getTemplateName()
    {
        return "C:\\Users\\Pfumiko\\Desktop\\OpenServer\\domains\\caforward2/themes/medrum/pages/aboutus.htm";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  69 => 3,  65 => 2,  62 => 1,);
    }

    public function getSourceContext()
    {
        return new Source("<div class=\"container-main\">
    {% partial 'infonav' %}
    <div class=\"container-main-aboutus\">
        <h2>О компании</h2>
        <div class=\"container-main-position\">
            <section>
                <p>Профессиональное коллекторское агентство, предоставляющее услуги полного цикла взыскания просроченной задолженности, а также организацию и сопровождение взыскания в рамках судебного и исполнительного производств.</p>
            </section>
            <seection>
                <p>Компания осуществляет свою деятельность в рамках действующего законодательства РФ, соблюдая этические нормы и уважая интересы всех лиц, задействованных в процессе взыскания.</p>
            </seection>
        </div>
    </div>
</div>", "C:\\Users\\Pfumiko\\Desktop\\OpenServer\\domains\\caforward2/themes/medrum/pages/aboutus.htm", "");
    }
}

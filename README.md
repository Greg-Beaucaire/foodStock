<h1>Les SCRIPTs</h1>

<pre>
<p>Script pour ajouter un nouvel aliment (le stock_id 1 correspond au Boolean 0 et le 2 au Boolean 1, déso pas déso)</p>
<b>INSERT INTO `aliment` (`id`, `nom`, `date_achat`, `prix_achat`, `stock_id`) VALUES (NULL, 'Chocolat au lait', NOW(), 'Le juste prix', '2');</b>
</pre></br>


<pre>
<p>Script pour ajouter une nouvelle saison</p>
<b>INSERT INTO `saison` (`id`, `saison`) VALUES (NULL, 'Janvier');</b>
</pre></br>


<pre>
<p>Script pour ajouter un nouveau type d'aliment</p>
<b>INSERT INTO `type` (`id`, `type`) VALUES (NULL, 'Flambynumineuse');</b>
</pre></br>


<pre>
<p>Script pour le stock (même si c'est un boolean et que du coup ça sert plus à rien d'en ajouter)</p>
<b>INSERT INTO `stock` (`id`, `stock`) VALUES (NULL, '2');</b>
</pre></br>


<pre>
<p>Script pour associer les entrées Aliment / Saison / Type</p>
<b>INSERT INTO `assoc_alim_type_saison` (`id`, `alim_id`, `type_id`, `saison_id`) VALUES (NULL, '3', '7', '3');</b>
</pre></br>

<pre>
<p>Script pour changer le statut 'stock' de l'aliment</p>
<b>UPDATE `aliment` SET `stock_id` = '1' WHERE `aliment`.`id` = 2;</b>
</pre></br>

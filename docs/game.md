## Game Actions

All games action requests must include a valid HTTP header `Authorization: Token
 token=<token>` or they will be rejected with a status of 401 Unauthorized.

All of the game actions follow the *RESTful* style.

Games are associated with users, `user_id`.
All actions will only retrieve a game if the user associated
 with the `Authorization` header matches the game's `user_id`.
If this requirement is unmet, the response will be 404 Not Found, except for
 the index action which will return an empty games array.

The data in the `goblin_state` and `player_state` columns of the database are
  stored as text. To extract the necessary data from them, simply run the string
  through JSON.parse, and it will be converted to a JavaScript object.

*Summary:*

<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>GET</td>
<td>`/games`</td>
<td>n/a</td>
<td>200, OK</td>
<td><strong>games found</strong></td>
</tr>
<tr>
  <td colspan="3">
  The default is to retrieve all games associated with the user..
  </td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>POST</td>
<td>`/games`</td>
<td>n/a</td>
<td>201, Created</td>
<td><strong>game created</strong></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>400 Bad Request</td>
  <td><strong>errors</strong></td>
</tr>
<tr>
<td>GET</td>
<td>`/games/:id`</td>
<td>n/a</td>
<td>200, OK</td>
<td><strong>game found</strong</td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>404 Not Found</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/games/:id`</td>
<td><strong>game delta</strong></td>
<td>200, OK</td>
<td><strong>game updated</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><strong>errors</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>404 Not Found</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>DELETE</td>
<td>`/games/:id`</td>
<td>n/a</td>
<td>204, No Content</td>
<td><strong>game deleted</strong</td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>404 Not Found</td>
  <td><em>empty</em></td>
</tr>
</table>

### index

The `index` action is a *GET* that retrieves all the games associated with a
 user.
The response body will contain JSON containing an array of games, e.g.:

```json
{
  "games": [
    {
      "id": 182,
      "user_id": 7,
      "over": false,
      "round": 1,
      "score": 0,
      "player_state": "{\"name\":\"player\",\"position\":[4,2],\"hp\":[10,10],\"
        attackDmg\":5,\"alive\":true,\"goblinCount\":1,\"lastMove\":\"up\",\"
        neighborIndices\":{\"up\":[3,2],\"down\":\"wall\",\"left\":[4,1],\"right
        \":[4,3]}}",
      "goblin_state": "[{\"name\":\"goblin1\",\"position\":[0,2],\"hp\":[10,10],
        \"attackDmg\":1,\"alive\":true,\"lastMove\":\"down\",\"neighborIndices\"
        :{\"up\":\"wall\",\"down\":[1,2],\"left\":[0,1],\"right\":[0,3]}}]"
    },
    {
      "id": 180,
      "user_id": 7,
      "over": true,
      "round": 11,
      "score": 2,
      "player_state": "{\"name\":\"player\",\"position\":[0,2],\"hp\":[0,10],\"
        attackDmg\":5,\"alive\":true,\"goblinCount\":3,\"lastMove\":\"down\",\"
        neighborIndices\":{\"up\":\"wall\",\"down\":[1,2],\"left\":[0,1],\"right
        \":[0,3]}}",
      "goblin_state": "[{\"name\":\"goblin2\",\"position\":[1,2],\"hp\":[5,10],
        \"attackDmg\":1,\"alive\":true,\"lastMove\":\"up\",\"neighborIndices\"
        :{\"up\":[0,2],\"down\":[2,2],\"left\":[1,1],\"right\":[1,3]}},{\"name\"
        :\"goblin3\",\"position\":[1,1],\"hp\":[10,10],\"attackDmg\":1,\"alive\"
        :true,\"lastMove\":\"right\",\"neighborIndices\":{\"up\":[0,1],\"down\":
        [2,1],\"left\":[1,0],\"right\":[1,2]}}]"
    }
  ]
}
```

If there are no games associated with the user, the response body will contain
 an empty games array, e.g.:

```json
{
  "games": [
  ]
}
```

### create

The `create` action expects a *POST* with an empty body (e.g `''` or `'{}'` if
 JSON).
If the request is successful, the response will have an HTTP Status of 201
 Created, and the body will contain JSON of the created game with `user_id` set
to the user calling `create`. The `player_state` and `goblin_state` values
currently default to null so that the initial player and goblin data can be
set client-side e.g.:

```json
{
  "game": {
    "id": 182,
    "user_id": 7,
    "over": false,
    "round": 1,
    "score": 0,
    "player_state": null,
    "goblin_state": null
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
 Request, and the response body will be JSON describing the errors.

### show

The `show` action is a *GET* specifing the `id` of the game to retrieve.
If the request is successful the status will be 200, OK, and the response body
 will contain JSON for the game requested, e.g.:

```json
{
  "game": {
    "id": 182,
    "user_id": 7,
    "over": false,
    "round": 1,
    "score": 0,
    "player_state": "{\"name\":\"player\",\"position\":[4,2],\"hp\":[10,10],\"
      attackDmg\":5,\"alive\":true,\"goblinCount\":1,\"lastMove\":\"up\",\"
      neighborIndices\":{\"up\":[3,2],\"down\":\"wall\",\"left\":[4,1],\"right
      \":[4,3]}}",
    "goblin_state": "[{\"name\":\"goblin1\",\"position\":[0,2],\"hp\":[10,10],
      \"attackDmg\":1,\"alive\":true,\"lastMove\":\"down\",\"neighborIndices\"
      :{\"up\":\"wall\",\"down\":[1,2],\"left\":[0,1],\"right\":[0,3]}}]"
  }
}
```

### update

#### update a game's states

This `update` action expects a *PATCH* with changes to to an existing game.
The `update` action expects data formatted as such:
```json
{
  "game": {
    "round": 11,
    "score": 2,
    "player_state": "{\"name\":\"player\",\"position\":[0,2],\"hp\":[0,10],\"
      attackDmg\":5,\"alive\":true,\"goblinCount\":3,\"lastMove\":\"down\",\"
      neighborIndices\":{\"up\":\"wall\",\"down\":[1,2],\"left\":[0,1],\"right
      \":[0,3]}}",
    "goblin_state": "[{\"name\":\"goblin2\",\"position\":[1,2],\"hp\":[5,10],
      \"attackDmg\":1,\"alive\":true,\"lastMove\":\"up\",\"neighborIndices\"
      :{\"up\":[0,2],\"down\":[2,2],\"left\":[1,1],\"right\":[1,3]}},{\"name\"
      :\"goblin3\",\"position\":[1,1],\"hp\":[10,10],\"attackDmg\":1,\"alive\"
      :true,\"lastMove\":\"right\",\"neighborIndices\":{\"up\":[0,1],\"down\":
      [2,1],\"left\":[1,0],\"right\":[1,2]}}]"
  }
}
```

If the request is successful, the response will have an HTTP Status of 200 OK,
 and the body will be JSON containing the modified game, e.g.:

```json
{
  "game": {
    "id": 180,
    "user_id": 7,
    "over": false,
    "round": 11,
    "score": 2,
    "player_state": "{\"name\":\"player\",\"position\":[0,2],\"hp\":[0,10],\"
      attackDmg\":5,\"alive\":true,\"goblinCount\":3,\"lastMove\":\"down\",\"
      neighborIndices\":{\"up\":\"wall\",\"down\":[1,2],\"left\":[0,1],\"right
      \":[0,3]}}",
    "goblin_state": "[{\"name\":\"goblin2\",\"position\":[1,2],\"hp\":[5,10],
      \"attackDmg\":1,\"alive\":true,\"lastMove\":\"up\",\"neighborIndices\"
      :{\"up\":[0,2],\"down\":[2,2],\"left\":[1,1],\"right\":[1,3]}},{\"name\"
      :\"goblin3\",\"position\":[1,1],\"hp\":[10,10],\"attackDmg\":1,\"alive\"
      :true,\"lastMove\":\"right\",\"neighborIndices\":{\"up\":[0,1],\"down\":
      [2,1],\"left\":[1,0],\"right\":[1,2]}}]"
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
 Request, and the response body will be JSON describing the errors.
